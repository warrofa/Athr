import 'package:athr_app/Core/constants/assetpaths.dart';
import 'package:athr_app/Core/google_auth_failure.dart';
import 'package:athr_app/Core/provider/firebase_providers.dart';
import 'package:athr_app/database/model/model.dart';
import 'package:athr_app/log/logging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Core/constants/firebase_constants.dart';
import '../../Core/typedef.dart';

final authRepoProvider = Provider(((ref) => AuthRepo(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider))));

class AuthRepo {
  //we dont want the following instance variables to e accesed outside the class hence why its private
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final log = logger;
//the above fields will be sent as parameters so as to faciletate the unit testing procedure

  AuthRepo(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  CollectionReference get _members =>
      _firestore.collection(FirebaseConstants.membersCollection);

  FutureEither<MemberModel> signInWithGoogle() async {
    MemberModel memberModel;
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      final credential = GoogleAuthProvider.credential(
        accessToken: (await googleuser?.authentication)
            ?.accessToken, //he access token represents the authorization of a specific application to access specific parts of a user's data.
        idToken: (await googleuser?.authentication)?.idToken, //get user info
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      
      log.i("%file: auth_repo% user credential has been retrieved - googleSignIn");

      
      if(userCredential.additionalUserInfo!.isNewUser){

        memberModel = MemberModel(
          userId: userCredential.user!.uid ?? "",
          name: userCredential.user!.displayName ?? "",
          username: "username",
          profilePic:
              userCredential.user!.photoURL ?? Constant.defualtProfilePic,
          isVerified: true,
          points: 0,
          isLead: false);
           log.i("%file: auth_repo% memberModel has been retrieved - googleSignIn");

      final Map<String, dynamic> mapped = memberModel.toMap();

      log.i("value of users id is" + mapped['userId']);

      await _members.doc(mapped['userId']).set(mapped);

      log.i("%file: auth_repo% memberModel has been uploaded- googleSignIn");

      }else{
        memberModel = await getMemberData( userCredential.user!.uid).first;
      }
      
       return right(memberModel); //in the case of success this will be returned, type of success is defined in the typedef.dart file
    } on FirebaseException catch(e){
      log.e("%file: auth_repo% firebase exception has been thrown - googleSignIn $e");
      throw e.message!;
    }catch (e) {
      log.e("%file: auth_repo% user credential has not been retrieved - googleSignIn $e");
          return left(Failure(e.toString()));
    }

   }

   Stream<MemberModel> getMemberData(String userId){
    //we will use a stream so that authenticated state persists even if the app is refereshed
    return _members.doc(userId).snapshots().map((event) => MemberModel.fromMap(event.data() as Map<String,dynamic>));
    /*
      Cloud Firestore retrieves data in a structure it calls a Snapshot. 
      A DocumentSnapshot contains data for a single document, while a QuerySnapshot 
      returns data for zero or more documents.
     */
   }
}
