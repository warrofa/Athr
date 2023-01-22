import 'package:athr_app/database/model/user_model.dart';
import 'package:meta/meta.dart';

class Story{
  final MemberModel membber;
  final String imageUrl;
  final bool isViewed;

  Story({required this.membber, required this.imageUrl, this.isViewed = false,});


}