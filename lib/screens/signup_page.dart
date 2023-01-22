import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../components/auth_top_bar.dart';
import '../components/authentecation_options.dart';
import '../components/custom_text_field.dart';
import '../log/logging.dart';
import '../database/model/user_model.dart';
import '../themes/light_theme.dart';

final log = logger;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final _controllerfullname = TextEditingController();
    final _controlleruname = TextEditingController();
    final _controllerpassword = TextEditingController();
    final _controlleremail = TextEditingController();
    final RoundedLoadingButtonController _btnGoogleController = RoundedLoadingButtonController();
    final RoundedLoadingButtonController _btnFacebookController = RoundedLoadingButtonController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: top_auth_bar(deviceWidth: deviceWidth),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    TextSpan(
                        text: "\nregister to become a part of athr",
                        style: Theme.of(context).textTheme.bodyText1)
                  ])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: _controlleruname,
                    isPassword: false,
                    hint: "Username",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: _controlleremail,
                    isPassword: false,
                    hint: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: _controllerpassword,
                    isPassword: true,
                    hint: "Password",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    controller: _controllerpassword,
                    isPassword: true,
                    hint: "Confirm password",
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text('Forgot password?',
                          style: TextStyle(color: Color(0xff6A707C))),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(11.0),
                        child: Text(
                          "Sign Up",
                          textScaleFactor: 1.2,
                        ),
                      )),
                ),
                AuthDivider(),
                AuthOptions(btnGoogleController: _btnGoogleController,btnFacebookController: _btnFacebookController,),
                Align(alignment: Alignment.bottomCenter,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\nAlready have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    TextSpan(
                        text: "Login in",
                        style: TextStyle(color: Colors.blue[600], fontSize: 16))
                  ])),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




