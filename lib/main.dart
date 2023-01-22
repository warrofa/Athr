import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'screens/start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //initialise the application
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // TODO: add ios auth support
);
  runApp(const ProviderScope(child: MyApp()));
}


  

