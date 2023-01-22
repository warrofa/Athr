import 'package:athr_app/database/model/user_framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

final log = Logger();
//TODO add blocked members

class MemberModel {
  final String userId;
  final String username;
  final String name;
  final String profilePic;
  final bool isVerified; // if guest or not
  final bool isLead; // if guest or not
  final int  points;
  MemberModel({
    required this.userId,
    required this.name,
    required this.username,
    required this.profilePic,
    required this.isVerified,
    required this.points,
    required this.isLead,
  });

  MemberModel copyWith({
    String? name,
    String? username,
    String? profilePic,
    String? userId,
    bool? isVerified,
    int?  points,
    bool? isLead,
  }) {
    return MemberModel(
      name: name ?? this.name,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      userId: userId ?? this.userId,
      isVerified: isVerified ?? this.isVerified,
       points: points ?? this.points,
      isLead: isLead ?? this.isLead,
    );
  }

//facilitates the process of apploading data to firebase
  Map<String, dynamic> toMap() {
    log.d("im in here");
    return{
      'name': this.name,
      'username': this.username,
      'profilePic': this.profilePic,
      'userId': this.userId,
      'isVerified': this.isVerified,
      'points': this.points,
      'isLead': this.isLead,
    };
  }

//facilitates the process of downloading data from firebase
  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      profilePic: map['profilePic'] ?? '',
      userId: map['userId'] ?? '',
      isVerified: map['isVerified'] ?? false,
      points: map['points']?.toInt() ?? 0,
      isLead: map['isVerified'] ?? false,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, username: $username, profilePic: $profilePic, userId: $userId, isVerified: $isVerified, points: $points, isLead: $isLead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemberModel &&
        other.name == name &&
        other.username == username &&
        other.profilePic == profilePic &&
        other.userId == userId &&
        other.isVerified == isVerified &&
        other.points == points &&
        other.isLead == isLead;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        username.hashCode ^
        profilePic.hashCode ^
        userId.hashCode ^
        isVerified.hashCode ^
        points.hashCode ^
        isLead.hashCode;
  }
}
