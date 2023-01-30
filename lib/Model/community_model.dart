// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:athr_app/Core/constants/image_constants.dart';
import 'package:flutter/foundation.dart';

import '../Logs/logger.dart';

final log = logger;
class CommunityModel {
  final String communityId;
  final String description;
  final String title;
  final String communityBanner;
  final String avatar;
  final List<String> members;
  final List<String> blockedMembers;
  final String lead;
  final List<String> mods; //community moderators
  final int heart;
  CommunityModel({
    required this.communityId,
    required this.title,
    required this.description,
    required this.communityBanner,
    required this.avatar,
    required this.members,
    required this.blockedMembers,
    required this.lead,
    required this.mods,
    required this.heart
  });


  CommunityModel copyWith({
    String? communityId,
    String? title,
    String? description,
    String? communityBanner,
    String? avatar,
    List<String>? members,
    List<String>? blockedMembers,
    String? lead,
    List<String>? mods,
    int? heart
  }) {
    return CommunityModel(
      communityId: communityId ?? this.communityId,
      title: title ?? this.title,
      description:description ?? this.description,
      communityBanner: communityBanner ?? this.communityBanner,
      avatar: avatar ?? this.avatar,
      members: members ?? this.members,
      blockedMembers: blockedMembers ?? this.blockedMembers,
      lead: lead ?? this.lead,
      mods: mods ?? this.mods,
      heart: heart ?? this.heart
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'communityId': communityId,
      'title': title,
      'description':description,
      'communityBanner': communityBanner,
      'avatar': avatar,
      'members': members,
      'blockedMembers': blockedMembers,
      'lead': lead,
      'mods': mods,
      'heart':heart
    };
  }

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    log.i("deep inside ${map['title']}");
    log.i("deep inside ${map['avatar']}");
    log.i("deep inside ${map['communityId']}");
    log.i("deep inside ${map['description']} and ${[]}");
    log.i("communityBanner :${List<String>.from((map['mods'] ?? []))} -communityModel");
    log.i("members :${List<String>.from((map['members'] ?? []))} -communityModel");

    return CommunityModel(
      //null checks in case there are missing values from the database
      avatar: map['avatar'] ?? ImageConstant.defualtProfilePic,
      blockedMembers: List<String>.from((map['blockedMembers']??[])),
      communityId: map['communityId'] ?? '',
      title: map['title'] ?? '',
      description:map['description'] ?? '',
      communityBanner: map['communityBanner'] ?? ImageConstant.defualtBanner,
      members: List<String>.from((map['members'] ?? [])),
      lead: map['lead'] ?? '',
      mods: List<String>.from((map['mods'] ?? [])),
      heart: map['heart'] ?? 0
    );
  }

  @override
  String toString() {
    return 'CommunityModel(communityId: $communityId, title: $title, communityBanner: $communityBanner, avatar: $avatar, members: $members, blockedMembers: $blockedMembers, lead: $lead, mods: $mods)';
  }

  @override
  bool operator ==(covariant CommunityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.communityId == communityId &&
      other.title == title &&
      other.description == description &&
      other.communityBanner == communityBanner &&
      other.avatar == avatar &&
      listEquals(other.members, members) &&
      listEquals(other.blockedMembers, blockedMembers) &&
      other.lead == lead &&
      listEquals(other.mods, mods) &&
      other.heart == heart;
  }

  @override
  int get hashCode {
    return communityId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      communityBanner.hashCode ^
      avatar.hashCode ^
      members.hashCode ^
      blockedMembers.hashCode ^
      lead.hashCode ^
      mods.hashCode ^
      heart;
  }
}
