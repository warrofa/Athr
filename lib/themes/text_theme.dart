import 'package:flutter/material.dart';

TextTheme text_Theme = getTextTheme();

TextTheme getTextTheme() => const TextTheme(
    headline1: TextStyle(
      fontSize: 45,
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Actor',
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 35,
      fontFamily: 'Actor',
      color: Color.fromARGB(255, 19, 19, 19),
    
    ),
    bodyText1:TextStyle(
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Actor',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Color.fromARGB(255, 19, 19, 19),
      fontFamily: 'Actor',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ) );

   
