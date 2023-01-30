import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  RouteToSignUp(context);
                },
                child: Text("Sign up")),
            ElevatedButton(
                onPressed: () {
                  RouteToLogIn(context);
                },
                child: Text("Log in"))
          ],
        ),
      )),
    );
  }
}

RouteToLogIn(BuildContext context) {
  Routemaster.of(context).push('/log-in');
}

RouteToSignUp(BuildContext context) {
  Routemaster.of(context).push('/sign-up');
}
