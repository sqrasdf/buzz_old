// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:buzz/pages/home_page.dart';
import 'package:buzz/pages/login_page.dart';
import 'package:buzz/service/auth_service.dart';
import 'package:buzz/service/shared_preferences_helper.dart';
import 'package:buzz/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to hide textfield when clicking away
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("yoo"),
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
                          // SizedBox(height: 20),
                          Text(
                            "BUZZ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 60,
                            ),
                          ),
                          Text(
                            "Bee yourself with Buzz",
                            // style: GoogleFonts.nunito(
                            //   fontSize: 25,
                            // ),
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
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
                          // customTextField(context, "Name"),
                          CustomTextField(
                            hintText: "Name",
                            controller: nameController,
                            regex: r"^[A-Za-z0-9]+$",
                            errorMessage: "Please enter your name",
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: "Email",
                            controller: emailController,
                            regex: r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                            errorMessage: "Please enter a valid email",
                          ),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: "Password",
                            controller: passwordController,
                            regex: r"^.{6,}$",
                            errorMessage:
                                "Password must be at least 6 characters long",
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                register();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                    child: Text(
                                  "Register",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  nextScrenReplacement(context, LoginPage());
                                  print("clicked on login page");
                                },
                                child: SizedBox(
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      "  Login here  ",
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
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

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await authService
          .registerUserWithEmailAndPassword(nameController.text,
              emailController.text, passwordController.text)
          .then((value) async {
        if (value == true) {
          nextScrenReplacement(context, HomePage());

          // save data in shared preferences
          await SharedPreferencesFunctions.saveUserLoggedInStatus(true);
          await SharedPreferencesFunctions.saveUserName(nameController.text);
          await SharedPreferencesFunctions.saveUserEmail(emailController.text);
        } else {
          print(value);
          showAlertBox(context, value, Colors.red);
          setState(() {
            isLoading = false;
          });
        }
      });
    }
  }
}
