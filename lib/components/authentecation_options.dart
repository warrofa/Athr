
import 'package:athr_app/services/controller/auth_controller.dart';
import 'package:athr_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Core/constants/assetpaths.dart';
import '../themes/pallete.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    Key? key,
    required RoundedLoadingButtonController btnGoogleController,
    required RoundedLoadingButtonController btnFacebookController,
  }) : _btnGoogleController = btnGoogleController, super(key: key);

  final RoundedLoadingButtonController _btnGoogleController;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GoogleAuthButton(btnGoogleController: _btnGoogleController),
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

class GoogleAuthButton extends ConsumerWidget {
  const GoogleAuthButton({
    Key? key,
    required RoundedLoadingButtonController btnGoogleController,
  }) : _btnGoogleController = btnGoogleController, super(key: key);

  int signInWithGoogle(WidgetRef ref){
    ref.read(AuthControllerProvider).signInWithGoogle();
    return 1;
  }

  final RoundedLoadingButtonController _btnGoogleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: ElevatedButton(
        onPressed: () => signInWithGoogle(ref), //onpressed takes in a function that returns a void function
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Image.asset(
            Constant.googlePath,
            width: 25,
            height: 25,

          ),
        ),
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Pallete.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(width: 3, color: Pallete.greyColor,),
          ),
        ),
      ),
    );
  }
}

