

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../validator/auth_validators/auth_input_state_wrapper.dart';

class InputState extends Equatable{
  
  final Uname username;
  final Email email;
  final Password password;
  //TODO: define name
  final FormzStatus status;
  final String? errorText;
  
  const InputState({this.username = const Uname.pure(), this.email=const Email.pure(), this.password=const Password.pure(),this.status = FormzStatus.pure,this.errorText});
  
  //so that we may update a value without having to update them all
  InputState copyWith({
    //TODO: define name
  Uname? username,
  Email? email,
  Password? password,
  FormzStatus? status,
  String? errorText,}){
    return InputState(
      //TODO: define name
      username: username??this.username,
      email: email??this.email,
      password: password??this.password,
      status: status??this.status,
      errorText:errorText??this.errorText

    );
  }

 
  @override
  List<Object?> get props => [username,email,password,status];
//Equatable overrides == and hashCode for you so you don't have 
//to waste your time writing lots of boilerplate code

 

}