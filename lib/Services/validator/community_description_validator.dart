
import 'package:formz/formz.dart';

enum CommunityDescriptionValidator {empty}

class CommunityDescription extends FormzInput<String, CommunityDescriptionValidator> {
  const CommunityDescription.pure() : super.pure('');
  const CommunityDescription.dirty([String value = ''])
      : super.dirty(value); //once user enters value

  @override
  CommunityDescriptionValidator? validator(String value) {
    if (value.isEmpty) {
      return CommunityDescriptionValidator.empty;
    }else{
      return null;
    }
  }

  static String? showEmailErrorText(CommunityDescriptionValidator? error) {
    if (error == CommunityDescriptionValidator.empty) {
      return "* field is empty";
    }else {
      return null;
    }
  }
}
