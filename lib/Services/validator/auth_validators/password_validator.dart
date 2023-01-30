import 'package:formz/formz.dart';

enum PasswordValidator { empty, invalid,short,weakpasword,notEqual }

Pattern passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#;.^"-_%\$&*~]).{8,}$';

//r'^
//  (?=.*[A-Z])          // should contain at least one upper case
//  (?=.*[a-z])          // should contain at least one lower case
//  (?=.*?[0-9])         // should contain at least one digit
//  (?=.*?[!@#\$&*~])    // should contain at least one Special character
//  .{8,}%               // Must be at least 8 characters in length  


class Password extends FormzInput<String, PasswordValidator> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = ''])
      : super.dirty(value); //once user enters value
  
  static final _regex = RegExp(passwordPattern.toString());
  

  @override
  PasswordValidator? validator(String value) {
    if (_regex.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return PasswordValidator.empty;
    }else if(value.length<8){
      return PasswordValidator.short;
    }
     else {
      return PasswordValidator.invalid;
    }
  }


  static String? showEmailErrorText(PasswordValidator? error) {
    if (error == PasswordValidator.empty) {
      return "Password is empty";
    } else if (error == PasswordValidator.invalid) {
      return "password must contain at least one special character, one uppercase letter and a digit";
    } else if (error == PasswordValidator.short) {
      return "password must contain atleast 8 characters";
    } else if (error == PasswordValidator.notEqual) {
      return "entered passwords are not the same";
    } 
    else {
      return null;
    }
  }
}