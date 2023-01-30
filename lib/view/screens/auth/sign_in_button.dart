
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Logs/logger.dart';
import '../../../Services/Controller/authentication/email_auth_controller.dart';

final log = logger;
class SignInButton extends ConsumerWidget {
  const SignInButton({
    Key? key,
    required this.controlleruename,
    required this.controllerpassword,
  }) : super(key: key);

  final TextEditingController controlleruename;
  final TextEditingController controllerpassword;

  void signInWithEmail(BuildContext context,WidgetRef ref,{required String email, required String password}){
    ref.read(authControllerProvider.notifier).singInWithEmail(context, email: email, password: password);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          signInWithEmail(context,ref,email:controlleruename.text,password:controllerpassword.text);
          //RouteToHomePage(context);
          log.i("value is c "+controlleruename.text);
          log.i("value of pasword "+controllerpassword.text);
          },
        child: const Padding(
          padding: EdgeInsets.all(11.0),
          child: Text(
            "Log in",
            textScaleFactor: 1.2,
          ),
        ));
  }
}