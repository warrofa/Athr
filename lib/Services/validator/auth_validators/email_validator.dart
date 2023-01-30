

import 'package:formz/formz.dart';

enum EmailValidator { empty, invalid }

Pattern emailPattern =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";

class Email extends FormzInput<String, EmailValidator> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = ''])
      : super.dirty(value); //once user enters value
  static final _regex = RegExp(emailPattern.toString());
  @override
  EmailValidator? validator(String value) {
    if (_regex.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return EmailValidator.empty;
    } else {
      return EmailValidator.invalid;
    }
  }

  static String? showEmailErrorText(EmailValidator? error) {
    if (error == EmailValidator.empty) {
      return "Enter an email";
    } else if (error == EmailValidator.invalid) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }
}
