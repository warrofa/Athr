
import 'package:athr_app/Core/constants/assetpaths.dart';
import 'package:athr_app/Core/provider/firebase_providers.dart';
import 'package:athr_app/database/model/model.dart';
import 'package:athr_app/log/logging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Core/constants/firebase_constants.dart';


final AuthRepoProvider = Provider(((ref) => AuthRepo(firestore: ref.read(firestoreProvider), auth: ref.read(authProvider), googleSignIn: ref.read(googleSignInProvider))));
class AuthRepo{
  //we dont want the following instance variables to e accesed outside the class hence why its private
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth; 
  final GoogleSignIn _googleSignIn;
  final log = logger;
//the above fields will be sent as parameters so as to faciletate the unit testing procedure

  AuthRepo({required FirebaseFirestore firestore,required FirebaseAuth auth,required GoogleSignIn googleSignIn}):_firestore=firestore,_auth = auth,_googleSignIn=googleSignIn;

  CollectionReference get _members => _firestore.collection(FirebaseConstants.membersCollection);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      final credential = GoogleAuthProvider.credential(
        accessToken: (await googleuser?.authentication)?.accessToken, //he access token represents the authorization of a specific application to access specific parts of a user's data.
        idToken: (await googleuser?.authentication)?.idToken, //get user info
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      //log.i("%file: auth_repo% user credential has been retrieved - googleSignIn");
      MemberModel memberModel = MemberModel(userId: userCredential.user!.uid??"", name: userCredential.user!.displayName??"", username: "username", profilePic: userCredential.user!.photoURL??Constant.defualtProfilePic, isVerified: true, points: 0, isLead: false);
      log.i("%file: auth_repo% memberModel has been retrieved - googleSignIn");
      final Map<String, dynamic> mapped = memberModel.toMap();
      log.i("value of users id is"+mapped['userId']);
      await _members.doc(mapped['userId']).set(mapped);
      log.i("%file: auth_repo% memberModel has been uploaded- googleSignIn");
    } catch (e) {
      log.e("%file: auth_repo% user credential has not been retrieved - googleSignIn $e");
    }
  }
}