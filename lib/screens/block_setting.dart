import 'package:flutter/material.dart';

class BsettingPage extends StatelessWidget {
  const BsettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bar")),
      body: Center(child:Text("Inside blockchain setting page", style: Theme.of(context).textTheme.bodyText1,)),
    );
  }
}