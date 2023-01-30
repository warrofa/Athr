import 'package:athr_app/view/screens/auth/sign_up_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import '../../../Services/Controller/authentication/email_auth_controller.dart';
import '../../../Services/validator/auth_validators/email_validator.dart';
import '../../../Services/validator/auth_validators/password_validator.dart';
import '../../../Services/validator/auth_validators/username_validator.dart';
import '../../components/auth_text_field.dart';
import '../../components/password_text_field.dart';

part 'sign_up_part2.dart';

  class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
    final _controllerfullname = TextEditingController();

    final _controlleruname = TextEditingController();

    final _controllerpassword = TextEditingController();

    final _controllerpassword2 = TextEditingController();

    final _controlleremail = TextEditingController();

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                  child: UsernameInput(controlleruname: _controlleruname),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EmailInput(controlleremail: _controlleremail),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PasswordInput(controllerpassword1: _controllerpassword),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConformPasswordInput(controllerpassword2: _controllerpassword2,controllerpassword1: _controllerpassword,),
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
                  child: SignUpButton(username: _controlleruname.text,email: _controlleremail.text,password: _controllerpassword.text,),
                ),
                
                Align(alignment: Alignment.bottomCenter,
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "\nAlready have an account? ",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          routeToLogIn(context);
                        })
                    ,
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








void routeToLogIn(BuildContext context){
  Routemaster.of(context).push('/log-in');
}

routeToHomePage(BuildContext context)async{
  
  Routemaster.of(context).push('/home-page');
}


