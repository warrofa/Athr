import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bar"),),
      body: Center(child:Text("Inside blockchain account page", style: Theme.of(context).textTheme.bodyText1,)),
    );
  }
}