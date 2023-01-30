

import 'package:formz/formz.dart';

enum UnameValidator { empty, invalid,short }

String unamePattern = r"[-+!$%^&*., ?]";

class Uname extends FormzInput<String, UnameValidator> {
  const Uname.pure() : super.pure('');
  const Uname.dirty([String value = ''])
      : super.dirty(value); //once user enters value
  static final _regex = RegExp(unamePattern.toString());
  @override
  UnameValidator? validator(String value) {
    if (value.length<6) {
      return UnameValidator.short;
    } else if (value.isEmpty) {
      return UnameValidator.empty;
    }else if(RegExp('[-+_!;`"\'\\/\$%^&*., ?]').hasMatch(value)){
      return UnameValidator.invalid;
    }
     else {
      return null;
    }
  }

  static String? showUsernameErrorText(UnameValidator? error) {
    if (error == UnameValidator.empty) {
      return "Enter a username";
    } else if (error == UnameValidator.invalid) {
      return "only permissable special characters are @ # _ and no blank spaces";
    } else if (error == UnameValidator.short) {
      return "username must contain at least 6 characters";
    } 
    else {
      return null;
    }
  }
}