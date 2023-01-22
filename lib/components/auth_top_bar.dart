import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../database/model/user_model.dart';
import '../themes/light_theme.dart';

class top_auth_bar extends StatelessWidget {
  const top_auth_bar({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: borderColour, width: 2),
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed('/startpage');
            },
            color: borderColour,
          ),
        ),
        Image.asset(
          'assets/DarkSymbol.png',
          width: deviceWidth / 6,
        )
      ],
    );
  }
}



