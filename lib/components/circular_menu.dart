import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Theme/Colour_Theme/colors.dart';
import 'menu_icons.dart';

class DarkCirleMenu extends StatelessWidget {
  const DarkCirleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      fabSize: 70,
      fabColor: Colors.transparent,
      ringColor: athrDarkblue.withOpacity(0.9),
      fabElevation: 0,
      ringWidth: 60,
      ringDiameter: 280,
      fabOpenIcon: Container(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 4),
          child: Image.asset('assets/DarkSymbol.png')),
      fabIconBorder: RoundedRectangleBorder(
          side: BorderSide(width: 1.1, color: athrDarkblue),
          borderRadius: BorderRadius.circular(100)),
      alignment: Alignment.topLeft,
      children: [
        IconAccount(),
        Transform.rotate(
            angle: 90 * 3.14159265359/ 180,
            child: IconSetting()),
        IconLogout(),
      ],
    );
  }
}
