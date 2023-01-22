import 'package:athr_app/database/Repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AuthControllerProvider = Provider(((ref) => AuthController(authRepo: ref.read(AuthRepoProvider))));
class AuthController{
  final AuthRepo _authRepo;
  AuthController({required AuthRepo authRepo}):_authRepo = authRepo;

  void signInWithGoogle(){
    _authRepo.signInWithGoogle();
  }

  void createUsername(){
    
  }
}