
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import '../../components/auth_text_field.dart';
import '../../components/password_text_field.dart';
import 'sign_in_button.dart';

  class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
late final TextEditingController controlleruename;
late final TextEditingController controllerpassword;
  @override
  void initState() {
    controlleruename = TextEditingController();
    controllerpassword = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;


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
                  child: InputTextField(controller: controlleruename,hint: "username",),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PasswordTextField(controller: controllerpassword,hint:"password",hasIcon: true,),
                ),
                
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text('Forgot password?',
                          style: TextStyle(color: Color(0xff6A707C))),
                    )),
                Align(
                  alignment: Alignment.center,
                  child: SignInButton(controlleruename: controlleruename, controllerpassword: controllerpassword),
                ),
                
                Align(alignment: Alignment.bottomCenter,
                  child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account ? \n",
                      style: Theme.of(context).textTheme.bodyText1),
                  TextSpan(
                      text: 'Sing Up',
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          
                          routeToSignUp(context);
                        })
                ]),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


routeToSignUp(BuildContext context){
  
  Routemaster.of(context).push('/sign-up');
}

routeToHomePage(BuildContext context)async{
  
  Routemaster.of(context).push('/home-page');
}