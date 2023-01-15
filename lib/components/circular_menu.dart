import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'menu_icons.dart';

class DarkCirleMenu extends StatelessWidget {
  const DarkCirleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      fabSize: 70,
      fabColor: Colors.transparent,
      ringColor: Color(0xff223593).withOpacity(0.9),
      fabElevation: 0,
      ringWidth: 60,
      ringDiameter: 280,
      fabOpenIcon: Container(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 4),
          child: Image.asset('assets/DarkSymbol.png')),
      fabIconBorder: RoundedRectangleBorder(
          side: BorderSide(width: 1.1, color: Color(0xff223593)),
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
