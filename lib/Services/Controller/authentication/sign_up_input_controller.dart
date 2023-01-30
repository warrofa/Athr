

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../Logs/logger.dart';
import '../../validator/auth_validators/email_validator.dart';
import '../../validator/auth_validators/password_validator.dart';
import '../../validator/auth_validators/username_validator.dart';
import 'sign_up_state.dart';

class SignUpInputsControllerNotifier extends StateNotifier<InputState> {
  SignUpInputsControllerNotifier(): super(const InputState()); //initialiase it with defual values
  final log = logger;
  void onNameChange(){
  }

  void onUnameChange(String value){
    final username =Uname.dirty(value);
    state = state.copyWith(username: username,status: Formz.validate([username,state.email,state.password]));
  }
   void onEmailChange(String value){
    final email =Email.dirty(value);
    state = state.copyWith(email:email,status: Formz.validate([state.username,email,state.password]));
  }
   void onPasswordChange(String value){
    final password =Password.dirty(value);
    state = state.copyWith( password:password,status: Formz.validate([state.username,state.email,password]));
  } 
  void signUpWithEmail()async{
    if(!state.status.isValidated){
      log.i("is validated");
    }else{
      log.i("not validated validated");
    }
  }
}