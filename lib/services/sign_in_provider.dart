import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//For a user to use our application they must be signed.
//this class is used to check the authentication of our program
//extends changenotifier so 
class SignInProvider extends ChangeNotifier{

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  SignInProvider(){
    checkSignInUser();
  }

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false; //check wither user is signed in
    notifyListeners();
  }
}

//