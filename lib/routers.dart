
import 'package:athr_app/view/screens/auth/sign_in.dart';
import 'package:athr_app/view/screens/community/community_screen.dart';
import 'package:athr_app/view/screens/community/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'view/screens/auth/sign_up.dart';
import 'view/screens/auth/start_screen.dart';

final guestRoute = RouteMap(routes: {
  '/':(_) => const MaterialPage(child: StartPage()),
  '/log-in':(_) => const MaterialPage(child: LogInPage()),
  '/sign-up':(_) => MaterialPage(child: SignUpPage()),
  '/home-page':(_) => const MaterialPage(child: HomePage())
});

final loggedInRoute = RouteMap(routes: {
  '/':(_) => const MaterialPage(child: HomePage()),
  '/community/:name':((route) => MaterialPage(child: CommunityScreen(pathName: route.pathParameters['name']!)))
 // '/incommunity/:name':((route) => MaterialPage(child: CommunityScreen(pathName: route.pathParameters['name']!)))
});