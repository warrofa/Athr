import 'package:athr_app/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.phone, color: Colors.white,)),
            )),

        Container(
          
            decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google,color: Colors.white,))),
            )
      ],
    );
  }
}