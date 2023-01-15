
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    Key? key,
    required RoundedLoadingButtonController btnGoogleController,
    required RoundedLoadingButtonController btnFacebookController,
  }) : _btnGoogleController = btnGoogleController,_btnFacebookController = btnFacebookController, super(key: key);

  final RoundedLoadingButtonController _btnGoogleController;
  final RoundedLoadingButtonController _btnFacebookController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FacebookAuth(btnFacebookController: _btnFacebookController),

        GoogleAuth(btnGoogleController: _btnGoogleController),
      ],
    );
  }
}

class AuthDivider extends StatelessWidget {
  const AuthDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Or Sign up with",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
            child: Divider(
          color: Colors.grey,
        )),
      ],
    );
  }
}

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({
    Key? key,
    required RoundedLoadingButtonController btnGoogleController,
  }) : _btnGoogleController = btnGoogleController, super(key: key);

  final RoundedLoadingButtonController _btnGoogleController;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(controller: _btnGoogleController, onPressed: (){}, 
    borderRadius: 10,
    color: Colors.blue,
    width: 60,
    height: 60,
    elevation: 1,
    child: FaIcon(FontAwesomeIcons.google, color: Colors.white,size: 30));
  }
}

class FacebookAuth extends StatelessWidget {
  const FacebookAuth({
    Key? key,
    required RoundedLoadingButtonController btnFacebookController,
  }) : _btnFacebookController = btnFacebookController, super(key: key);

  final RoundedLoadingButtonController _btnFacebookController;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(controller: _btnFacebookController, onPressed: (){}, 
    borderRadius: 10,
    color: Colors.blue,
    width: 60,
    height: 60,
    elevation: 1,
    child: FaIcon(FontAwesomeIcons.facebook, color: Colors.white,size: 40,));
  }
}