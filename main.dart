// ignore_for_file: prefer_const_constructors, unused_import

import 'package:buzz/pages/home_page.dart';
import 'package:buzz/pages/login_page.dart';
import 'package:buzz/pages/register_page.dart';
import 'package:buzz/service/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    // check in shared preferences if user is logged in
    SharedPreferencesFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          isLoggedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      home: isLoggedIn ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
