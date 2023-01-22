import 'package:athr_app/components/utils/snackbar.dart';
import 'package:athr_app/database/Repository/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AuthControllerProvider = Provider(((ref) => AuthController(authRepo: ref.read(AuthRepoProvider))));
class AuthController{
  final AuthRepo _authRepo;
  AuthController({required AuthRepo authRepo}):_authRepo = authRepo;

  void signInWithGoogle(BuildContext context)async{
   final member = await _authRepo.signInWithGoogle();
   member.fold((l) => showSnackBar(context, l.message), (r) => null); //l represents the fialure while r is the success
  }

  void createUsername(){
    
  }
}