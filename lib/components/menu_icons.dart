import 'package:athr_app/Theme/colour_theme/colors.dart';
import 'package:flutter/material.dart';

class IconSetting extends StatelessWidget {
  const IconSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/blockSetting');
        },
        icon: Icon(
          Icons.tune_outlined,
          size: 30,
          color: Colors.white,
        ));
  }
}

class IconAccount extends StatelessWidget {
  const IconAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/account');
      },
      icon: Icon(
        size: 30,
        color: Colors.white,
        Icons.account_circle_outlined,
      ),
    );
  }
}

class IconHome extends StatelessWidget {
  const IconHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
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

class IconLogout extends StatelessWidget {
  const IconLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/startpage', (route) => false);
      },
      icon: Icon(
        size: 30,
        color: Colors.white,
        Icons.logout_outlined,
      ),
    );
  }
}
