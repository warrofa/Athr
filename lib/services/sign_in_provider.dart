import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../log/logging.dart';
import '../model/user_model.dart';

//For a user to use our application they must be signed.
//this class is used to check the authentication of our program
//extends changenotifier so 
class AuthServices extends ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance; // private variable that will hold firbase instance
  final log = logger;


  Stream<Member> get user{
    return _auth.authStateChanges().map((User? user) => _createuser(user));
  }
  //TODO sign in anonymously
  Future signInAnon()async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!; 
      return _createuser(user);//user object represents a user account that has signed up for an app in your project
    }catch(error){
      log.e(error.toString());
      return null;
    }
  }
  //TODO create user object based on Firebase
  Member _createuser(User? user){
    return Member(userId:user?.uid??" " ,fullName: user?.displayName??" ",imageUrl: user?.photoURL??" ");
  }
  //TODO sign in with email and password
  //TODO sign in with gmail
  //TODO sign out
}

//