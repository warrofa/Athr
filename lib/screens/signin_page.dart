import 'package:athr_app/services/sign_in_provider.dart';
import 'package:athr_app/themes/light_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../components/auth_top_bar.dart';
import '../components/authentecation_options.dart';
import '../components/custom_text_field.dart';
import '../log/logging.dart';
final log = logger;
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController _btnGoogleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnFacebookController =
      RoundedLoadingButtonController();
  final _controlleruname = TextEditingController();
  final _controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: top_auth_bar(
                deviceWidth: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome To Athr",
                    style: Theme.of(context).textTheme.headline2,
                  )),
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
                controller: _controllerpassword,
                isPassword: true,
                hint: "Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){validateUser();}, child: Text("Log in")),
            ),
            const AuthDivider(),
            AuthOptions(
              btnGoogleController: _btnGoogleController,
              btnFacebookController: _btnFacebookController,
            ),
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
      ),
    );
  }
}

validateUser()async {
  final AuthServices _auth = AuthServices();
  dynamic result = await _auth.signInAnon();
  result ?? log.e("failed to sign in anonymoisly");
  log.i("file: signin_page - ${result.userId}");
}
