import 'package:athr_app/model/user_framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
final log = Logger();
//TODO add blocked members

class User implements UserFrame{
  final String userId;
  final String fullName;
  final String imageUrl;
  final String username;
  final DateTime birthday;

  User( 
    {this.userId = '',
    required this.fullName,
    required this.imageUrl,
    required this.username,
    required this.birthday}
  );

  Map<String, dynamic> toJson() => {
        'User_id': userId,
        'first name' : fullName,
        'imageUrl' : imageUrl,
        'username' : username
      };

  static User fromJson(Map<String, dynamic> json){ 
    log.i("user_model - "+json['User_id']);
    log.i("user_model - "+json['first name']);
    log.i("user_model - "+json['last name']);
    log.i("user_model - "+json['imageUrl']);
    log.i("user_model - "+json['username']);
    return User(
    userId: json['User_id'],
    fullName: json['first name'],
    imageUrl: json['imageUrl'],
    username: json['username'],
    birthday: (json['birthday'] as Timestamp).toDate());}
}