
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../components/auth_top_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
 final RoundedLoadingButtonController _btnGoogleController = RoundedLoadingButtonController();
 final RoundedLoadingButtonController _btnFacebookController = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          top_auth_bar(deviceWidth: MediaQuery.of(context).size.width,),
          Container(
            margin: EdgeInsets.all(30),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Don't have an account ? \n",
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text: 'Sing Up',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/signup', (route) => false);
                      })
              ]),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}

bool validateUser (){
  
return false;
}
