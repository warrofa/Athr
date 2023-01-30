import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../validator/community_description_validator.dart';
import '../../validator/community_title_validator.dart';

class CommunityInputState extends Equatable{
  
  final CommunityTitle title;
  final CommunityDescription description;
  final FormzStatus status;
  final String? errorText;
  
  const CommunityInputState({this.title = const CommunityTitle.pure(), this.description=const CommunityDescription.pure(), this.status = FormzStatus.pure,this.errorText});
  
  //so that we may update a value without having to update them all
  CommunityInputState copyWith({
    //TODO: define name
  CommunityTitle? title,
  CommunityDescription? description,
  FormzStatus? status,
  String? errorText,}){
    return CommunityInputState(
      title: title??this.title,
      description: description??this.description,
      status: status??this.status,
      errorText:errorText??this.errorText

    );
  }

 
  @override
  List<Object?> get props => [title,description,status];
//Equatable overrides == and hashCode for you so you don't have 
//to waste your time writing lots of boilerplate code

 

}