// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buzz/pages/login_page.dart';
import 'package:buzz/service/auth_service.dart';
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
      // drawer: Drawer(),
      appBar: AppBar(
          // leading: Icon(),
          // leading: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     alignment: Alignment.center,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage(
          //           'assets/images/bee_nobg_nooutline.png',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          title: Text(
            "BUZZ",
            style: TextStyle(fontSize: 40),
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            TextButton(
              onPressed: () {
                AuthService().signOut();
                nextScrenReplacement(context, LoginPage());
              },
              child: Text(
                "log out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            // upper panel

            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
            CustomContactView2(),
          ]),
        ),
      ),
    );
  }
}
