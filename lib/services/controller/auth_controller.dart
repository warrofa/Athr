import 'package:athr_app/components/utils/snackbar.dart';
import 'package:athr_app/database/Repository/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/model/user_model.dart';

final memberProvider = StateProvider<MemberModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    ((ref) => AuthController(authRepo: ref.watch(authRepoProvider), ref: ref)));

class AuthController extends StateNotifier<bool> {
  final AuthRepo _authRepo;
  final Ref _ref;
  AuthController({required AuthRepo authRepo, required Ref ref})
      : _authRepo = authRepo,
        _ref = ref,
        super(false); //false represents the loading

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final member = await _authRepo.signInWithGoogle();
    state = false; //once we get user credentials loading will stop
    member.fold(
        (l) => showSnackBar(context, l.message),
        (memberModel) => _ref.read(memberProvider.notifier).update((state) =>
            memberModel)); //l represents the fialure while r is the success
  }

  void singInWithEmail() {}
}
