import 'package:flutter/material.dart';


class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/dashboard');
          },
          icon: Icon(
            size: 30,
            color: Colors.white,
            Icons.home_outlined,
          ),
        );
  }
}

class AcountIcon extends StatelessWidget {
  const AcountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/dashboard');
          },
          icon: Icon(
            size: 30,
            color: Colors.white,
            Icons.home_outlined,
          ),
        );
  }
}

class SettingIcon extends StatelessWidget {
  const SettingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/dashboard');
          },
          icon: Icon(
            size: 30,
            color: Colors.white,
            Icons.tune_outlined,
          ),
        );
  }
}