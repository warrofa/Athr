
import 'package:flutter/material.dart';
import 'Theme/Colour_Theme/colors.dart';
import 'Theme/font_theme/font_style.dart';
import 'components/logos.dart';
import 'dashboard_page.dart';
import 'signin_page.dart';
import 'signup_page.dart';
import 'splash.dart';


final ThemeData _AthrTheme = _buildAthrTheme();

ThemeData _buildAthrTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: athrDarkblue,
      onPrimary: athrWhite,
      secondary: athrblue,
      error: athrError,
    ),
    textTheme: getTextTheme(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Athr",
        initialRoute: '/splash',
        theme: _buildAthrTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash': (BuildContext context) => const Splash(),
          '/startpage': (BuildContext context) => const startPage(),
          '/signin': (BuildContext context) => const SignInPage(),
          '/signup': (BuildContext context) => const SignUpPage(),
          '/dashboard': (BuildContext context) => const HomePage(),
        });
  }
}

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhoneSignIn(),
    );
  }
}

class PhoneSignIn extends StatelessWidget {
  const PhoneSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopDesign(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              text: TextSpan(children: [
                TextSpan(
                    text: "We are all born to leave an impression\n",
                    style: Theme.of(context).textTheme.headline2),
                TextSpan(
                    text:
                        'with athr storing and sharing certificates has never be easier',
                    style: Theme.of(context).textTheme.bodyText1)
              ])),
        ),
        Align(alignment: Alignment.bottomCenter, child: Btns()),
      ],
    );
  }
}

class TopDesign extends StatelessWidget {
  const TopDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: deviceWidth,
          height: deviceHeight * 0.55,
          decoration: BoxDecoration(
              color: athrDarkblue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(26))),
        ),
        Container(
            width: deviceWidth,
            height: deviceHeight * 0.48,
            decoration: BoxDecoration(
                color: athrWhite,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(26)))),
        DarkSymbol(
          size: deviceHeight / 3.5,
          bottomPadding: 0,
        )
      ],
    );
  }
}

class Btns extends StatelessWidget {
  const Btns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {
         Navigator.pushNamedAndRemoveUntil(context, '/signin', (route) => false);
        }, child: Text("Singin")),
        ElevatedButton(onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/signup', (route) => false);}, child: Text("Singup"))
      ],
    );
  }
}
