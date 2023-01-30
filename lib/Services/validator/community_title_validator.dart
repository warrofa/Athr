import 'package:formz/formz.dart';

enum CommunityTitleValidator { empty, invalid }

class CommunityTitle extends FormzInput<String, CommunityTitleValidator> {
  const CommunityTitle.pure() : super.pure('');
  const CommunityTitle.dirty([String value = ''])
      : super.dirty(value); //once user enters value

  @override
  CommunityTitleValidator? validator(String value) {
    if (value.isEmpty) {
      return CommunityTitleValidator.empty;
    } else if(RegExp('[-+_!;`"\'\\/\$%^&*., ?]').hasMatch(value)){
      return CommunityTitleValidator.invalid;
    }else{
      return null;
    }
  }

  static String? showEmailErrorText(CommunityTitleValidator? error) {
    if (error == CommunityTitleValidator.empty) {
      return "* field is empty";
    } else if (error == CommunityTitleValidator.invalid) {
      return "A valid community only allows ~ @ # as special characters";
    } else {
      return null;
    }
  }
}
