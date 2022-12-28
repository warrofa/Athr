import 'package:athr_app/Theme/colour_theme/colors.dart';
import 'package:athr_app/components/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

import 'components/toggle_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DarkCirleMenu(),
      body: SafeArea(child: Column(children: [ToggleBarComponent(),],)),
    );
  }
}
