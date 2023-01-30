
import 'package:athr_app/view/screens/auth/auth_wrapper.dart';
import 'package:athr_app/view/screens/community/community_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Services/locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServices();
  setupBottomSheetUi();
  runApp(const ProviderScope(
      child: MyApp()
      )
  ); 
    //we must wrap the top level widget with providerScope
  // so that we may use riverpod as state management
}


  

