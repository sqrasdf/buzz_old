// ignore_for_file: prefer_const_constructors

import 'package:buzz/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("home page here"),
          ElevatedButton(
              onPressed: () {
                showAlertBox(context, "message", Colors.red);
              },
              child: Text("yoooo"))
        ],
      )),
    );
  }
}
