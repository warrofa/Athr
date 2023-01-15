
import 'package:athr_app/themes/text_theme.dart';
import 'package:flutter/material.dart';

// colours used in the application


ThemeData buildLightTheme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    brightness: Brightness.light,
    primary: Color(0xff395ba9),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffdae2ff),
    onPrimaryContainer: Color(0xff001947),
    secondary: Color(0xff9b4051), //aa3520 
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffd9dd),
    onSecondaryContainer: Color(0xff400012),
    tertiary: Color(0xff4b57a9),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffdfe0ff),
    onTertiaryContainer: Color(0xff000d5f),
    error: Color(0xffba181f),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410003),
    background: Color(0xffffffff),
    onBackground: Color(0xfffffbff),
    surface: Color(0xffffffff),
    onSurface: Color(0xff1c1b1e),
    outline: Color(0xff948f99),
  ),
  textTheme: text_Theme,
  dividerColor: Color(0xffdae2ff),
  );

ColorScheme pallete() {
    return const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff4e57a9),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffdfe0ff),
    onPrimaryContainer: Color(0xff010965),
    secondary: Color(0xffaa3520),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffdad3),
    onSecondaryContainer: Color(0xff3f0400),
    error: Color(0xffba181f),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410003),
    background: Color(0xffffffff),
    onBackground: Color(0xfffffbff),
    surface: Color(0xffffffff),
    onSurface: Color(0xff1c1b1e),
  );
  }



 final borderColour = Color(0xff010965);

