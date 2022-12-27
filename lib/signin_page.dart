
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Container(
              alignment: Alignment.centerRight,
              child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/DarkSymbol.png',
                    height: deviceHeight / 8,
                  ))),
          Container(
            margin: EdgeInsets.all(30),
            child:
                Text("Sign In", style: Theme.of(context).textTheme.headline2),
          ),
          Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                decoration:
                    InputDecoration(filled: true, labelText: "Username"),
              )),
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                labelText: "Password",
                fillColor: Color.fromARGB(255, 239, 240, 243),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: RichText(
                text: TextSpan(
                    text: 'Forgot password?',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/signup', (route) => false);
                      })),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/dashboard', (route) => false);
              },
              child: Text("Sign in")),
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

bool ValidateUser (){
  
return false;
}
