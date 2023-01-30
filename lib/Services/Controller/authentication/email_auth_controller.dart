// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:athr_app/Services/Controller/authentication/sign_up_input_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Logs/logger.dart';
import '../../../Model/member_model.dart';
import '../../../view/components/show_snack_bar.dart';
import '../../Repository/auth_repo.dart';
import 'sign_up_state.dart';


final memberProvider = StateProvider<MemberModel?>((ref) => null);
final log = logger;
final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    ((ref) => AuthController(authRepo: ref.watch(authRepoProvider), ref: ref)));

final authStateChangeProvider = StreamProvider((ref){
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getMemberDataProvider = StreamProvider.family((ref, String userId){
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getMemberData(userId);
});
                                                    //class and the state it keeps track of
final signUpInputsProvider = StateNotifierProvider.autoDispose<SignUpInputsControllerNotifier,InputState>((ref) {
  return SignUpInputsControllerNotifier() ; //its autoDispose since we want it to be disposed once we fined sign up
});

class AuthController extends StateNotifier<bool> {
  final AuthRepo _authRepo;
  final Ref _ref;
  AuthController({required AuthRepo authRepo, required Ref ref})
      : _authRepo = authRepo,
        _ref = ref,
        super(false); //false represents the loading

  Stream<User?> get authStateChange=> _authRepo.authStateChange; 
  //gets whether user is signed in or out


  void signInWithGoogle(BuildContext context) async {
    state = true;
    final member = await _authRepo.signInWithGoogle();
    state = false; //once we get user credentials loading will stop
    member.fold(
        (l) => showSnackBar(context, l.message),
        (memberModel) => _ref.read(memberProvider.notifier).update((state) =>
            memberModel)); //l represents the fialure while r is the success
  }

  void singInWithEmail(BuildContext context,{required String email, required String password})async {
    state = true;
    final member = await _authRepo.signInWithEmail(email: email, password: password);
    state = false;
    member.fold(
        (l) => showSnackBar(context, l.message),
        (memberModel) => _ref.read(memberProvider.notifier).update((state) =>
            memberModel)); //l represents the fialure while r is the success


  }
  void createMemberWithEmail(BuildContext context,{required String username,required String email, required String password,})async{
    log.i("inside create method");
    state = true;
    final member = await _authRepo.signUpWithEmail( username: username, email: email, password: password);
    state = false;
    member.fold(
        (l) => showSnackBar(context, l.message),
        (memberModel) => _ref.read(memberProvider.notifier).update((state) =>
            memberModel));
  }

  Stream<MemberModel> getMemberData(String userId){
    return _authRepo.getMemberData(userId);
  }
}
