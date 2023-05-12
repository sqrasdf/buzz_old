// ignore_for_file: prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:buzz/pages/home_page.dart';
import 'package:buzz/pages/register_page.dart';
import 'package:buzz/service/auth_service.dart';
import 'package:buzz/service/shared_preferences_helper.dart';
import 'package:buzz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  AuthService authService = AuthService();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to hide textfield when clicking away
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("yooo"),
        //   centerTitle: true,
        // ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor))
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // BUZZ
                          Text(
                            "BUZZ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          // subtitle
                          Text(
                            "Stay connected with Buzz",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 20),
                          // bee image
                          Container(
                            height: 150,
                            width: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/bee_nobg_nooutline.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // email field
                          CustomTextField(
                            hintText: "Email",
                            controller: emailContoller,
                            regex: r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                            errorMessage: "Please enter a valid email",
                          ),
                          SizedBox(height: 10),
                          // password field
                          CustomTextField(
                            hintText: "Password",
                            controller: passwordContoller,
                            regex: r"^.{6,}$",
                            errorMessage:
                                "Password must be at least 6 characters long",
                          ),
                          SizedBox(height: 16),
                          // log in button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                print("Email: " + emailContoller.text);
                                print("Password: " + passwordContoller.text);

                                login();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                    child: Text(
                                  "Log in",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          // button to change page to register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account yet?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  nextScrenReplacement(context, RegisterPage());
                                  print("clicked on register page");
                                },
                                child: SizedBox(
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      "  Register now  ",
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService
          .logInWithEmailAndPassword(
              emailContoller.text, passwordContoller.text)
          .then((value) async {
        if (value == true) {
          // get user data

          nextScrenReplacement(context, HomePage());

          // save data in shared preferences
          await SharedPreferencesFunctions.saveUserLoggedInStatus(true);
          await SharedPreferencesFunctions.saveUserName("username");
          await SharedPreferencesFunctions.saveUserEmail(emailContoller.text);
        } else {
          showAlertBox(context, value, Colors.red);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
