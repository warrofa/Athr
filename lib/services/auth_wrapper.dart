import 'package:flutter/material.dart';

import '../screens/start_page.dart';

//listens for authentication changes
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const StartPage();
  }
}