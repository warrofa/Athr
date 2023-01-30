
import 'package:athr_app/view/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../Logs/logger.dart';
import '../../../Services/Controller/authentication/email_auth_controller.dart';
final log = logger;
class SignUpButton extends ConsumerWidget {
  const SignUpButton({required this.email, required this.username, required this.password,
    Key? key,
  }) : super(key: key);
  final String email;
  final String username;
  final String password;

  void signUpWithEmail(BuildContext context,WidgetRef ref,{required String username,required String email, required String password,}){
    ref.read(authControllerProvider.notifier).createMemberWithEmail(context,username: username, email: email, password: password);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final signUpInputStates = ref.watch(signUpInputsProvider);
    final bool isValid = signUpInputStates.status.isValidated & passwordsAreEqual;
    final signUpInputsController = ref.read(signUpInputsProvider.notifier);
    return ElevatedButton(
        onPressed: () {
          if(isValid){
            log.i("Inputted fields are complete and correct");
            signUpWithEmail(context,ref,email: email,password: password,username: username);
          }else{
            log.i("Inputted fields are either not complete and/or not follow correct syntax");
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(11.0),
          child: Text(
            "Sign Up",
            textScaleFactor: 1.2,
          ),
        ));
  }
}