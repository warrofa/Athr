import 'package:flutter/material.dart';


class DarkLogo extends StatelessWidget {
  final double size;
  final double topPadding;
  final double bottomPadding;
  const DarkLogo({super.key, required this.size,this.topPadding = 60,this.bottomPadding =40});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: topPadding,bottom: bottomPadding),
        height: size,
        child: Image.asset('assets/logo-removebg-preview.png'),
      );
  }
}

class DarkSymbol extends StatelessWidget {
  final double size;
  final double topPadding;
  final double bottomPadding;

  const DarkSymbol({super.key, required this.size,this.topPadding = 60,this.bottomPadding =40});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: topPadding,bottom: bottomPadding),
        alignment: Alignment.center,
        height: size,
        child: Image.asset('assets/DarkSymbol.png'),
      );
  }
}