
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../Core/constants/firebase_constants.dart';
import '../../Core/error/email_auth_fialure.dart';
import '../../Core/typedef.dart';
import '../../Logs/logger.dart';
import '../../Model/community_model.dart';
import '../../provider/firebase_providers.dart';


  final communityRepoProvider = Provider<CommunityRepo>((ref) {
    return CommunityRepo(firestore: ref.watch(firestoreProvider)) ;
  });

class CommunityRepo{
  final FirebaseFirestore _firestore;
  
  final log = logger;
//the above fields will be sent as parameters so as to faciletate the unit testing procedure
  CommunityRepo(
      {required FirebaseFirestore firestore,

      })
      : _firestore = firestore;



  CollectionReference get _communities => _firestore.collection(FirebaseConstants.communitiesCollectoin);

FutureVoid createCommunity(CommunityModel community)async{
  try {
    var communityDoc = await _communities.doc(community.title).get();
    if(communityDoc.exists){
      throw 'Community name is taken';
    }
    return right(_communities.doc(community.title).set(community.toMap()));
  } on FirebaseException catch (e) {
    return left(Failure(message:e.message!));
  }catch(e){
    return left(Failure(message:e.toString()));
  }
}

Stream <List<CommunityModel>> getJoinedCommunity(String userId){
  log.i("inside joined community method");
 return  _communities.where('members',arrayContains:userId).snapshots().map((event){
  final i = event.size;
  log.i("%file :community_repo % the size of communities user is in $i - method : getJoinedCommunity");
  List<CommunityModel> communities = [];
  for(var doc in event.docs){

    communities.add(CommunityModel.fromMap(doc.data() as Map<String,dynamic>));
    log.i("joined community is added");
  }
  return communities;
 });
}

Stream <CommunityModel> getCommunityByTitle(String title){
  log.i("community title in get community is $title");
  final result = _communities.doc(title).snapshots().map((event) => CommunityModel.fromMap(event.data() as Map<String,dynamic>));
   log.i("community title in get community is $result");
  return result;
}
}