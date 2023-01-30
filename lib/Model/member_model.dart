// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class MemberModel {
  final String userId;
  final String username;
  final String profilePic;
  final bool isVerified; // if guest or not
  final bool isLead; // if guest or not
  final int  points;
  MemberModel({
    required this.userId,
    required this.username,
    required this.profilePic,
    required this.isVerified,
    required this.isLead,
    required this.points,
  });
  

  MemberModel copyWith({
    String? userId,
    String? username,
    String? profilePic,
    bool? isVerified,
    bool? isLead,
    int? points,
  }) {
    return MemberModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      isVerified: isVerified ?? this.isVerified,
      isLead: isLead ?? this.isLead,
      points: points ?? this.points,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'username': username,
      'profilePic': profilePic,
      'isVerified': isVerified,
      'isLead': isLead,
      'points': points,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      profilePic: map['profilePic'] as String,
      isVerified: map['isVerified'] as bool,
      isLead: map['isLead'] as bool,
      points: map['points'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemberModel.fromJson(String source) => MemberModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MemberModel(userId: $userId, username: $username, profilePic: $profilePic, isVerified: $isVerified, isLead: $isLead, points: $points)';
  }

  @override
  bool operator ==(covariant MemberModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.username == username &&
      other.profilePic == profilePic &&
      other.isVerified == isVerified &&
      other.isLead == isLead &&
      other.points == points;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      username.hashCode ^
      profilePic.hashCode ^
      isVerified.hashCode ^
      isLead.hashCode ^
      points.hashCode;
  }
  }
