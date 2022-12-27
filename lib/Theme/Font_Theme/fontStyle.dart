import 'package:flutter/material.dart';

TextTheme getTextTheme() => const TextTheme(
    headline1: TextStyle(
      fontSize: 45,
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Source_Sans_Pro',
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 35,
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Actor',
    ),
    bodyText1:TextStyle(
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Actor',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Color.fromARGB(255, 253, 253, 253),
      fontFamily: 'Actor',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ) );
