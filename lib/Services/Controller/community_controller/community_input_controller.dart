import 'package:athr_app/Services/validator/community_description_validator.dart';
import 'package:athr_app/Services/validator/community_title_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../Logs/logger.dart';
import 'community_input_state.dart';

class CommunityInputsNotifier extends StateNotifier<CommunityInputState> {
  CommunityInputsNotifier(): super(const CommunityInputState()); //initialiase it with defual values
  final log = logger;
  void onNameChange(){
  }

  void onCommunityTitleChange(String value){
    final title =CommunityTitle.dirty(value);
    state = state.copyWith(title: title,status: Formz.validate([title,state.description]));
  }
   void onDescriptionChange(String value){
    final description =CommunityDescription.dirty(value);
    state = state.copyWith(description:description,status: Formz.validate([state.title,description]));
  }
 
}