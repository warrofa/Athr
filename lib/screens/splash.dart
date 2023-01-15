
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/logos.dart';
import '../services/sign_in_provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}



class _SplashState extends State<Splash> {
  
  @override
  void initState(){
  super.initState();
  
  _navigateToStartPage();
  }

  void _navigateToStartPage()async{
    final sp = context.read<SignInProvider>();
    await Future.delayed(const Duration(milliseconds: 2500)); //splash screen will appear for 2.5 sec
    // ignore: use_build_context_synchronously
    sp.isSignedIn == false ? Navigator.pushNamedAndRemoveUntil(context, '/startpage', (route) => false) : Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
  }
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      DarkLogo(size: deviceHeight/3),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(child: Text("وُلدناَ جميعاً لنترك أثراً", style: Theme.of(context).textTheme.headline2 ,textDirection: TextDirection.rtl,)))
    ]));
  }
}
