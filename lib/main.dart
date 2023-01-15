import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //initialise the application
  await Firebase.initializeApp();
  runApp(const MyApp());
}
  

