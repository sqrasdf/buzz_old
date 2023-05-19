// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String regex;
  final String errorMessage;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.regex,
    required this.errorMessage,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: widget.hintText == "Password",
        controller: widget.controller,
        validator: (value) {
          return RegExp(widget.regex).hasMatch(value!)
              ? null
              : widget.errorMessage;
        },
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}

// pushes new page on top of original one
void nextScreen(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

// replaces original page with new one
void nextScrenReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

// show box with message on the bottom of the screen
void showAlertBox(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: Duration(seconds: 4),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}

class CustomContactView extends StatefulWidget {
  final String title;
  final String subtitle;
  const CustomContactView({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CustomContactView> createState() => _CustomContactViewState();
}

class _CustomContactViewState extends State<CustomContactView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.grey[300],
            leading: CircleAvatar(
              minRadius: 30,
              maxRadius: 30,
              backgroundColor: Colors.grey[400],
              backgroundImage: NetworkImage(
                  'https://www.woolha.com/media/2020/03/eevee.png'),
            ),
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.subtitle),
          ),
          Divider(
            height: 2,
          ),
        ],
      ),
    );
  }
}

class CustomContactView2 extends StatefulWidget {
  const CustomContactView2({super.key});

  @override
  State<CustomContactView2> createState() => _CustomContactView2State();
}

class _CustomContactView2State extends State<CustomContactView2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          color: Colors.grey[300],
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 35,
                    // backgroundColor: Colors.grey[400],
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shrek",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "some message hasdf sdfa fasd asdf asdf asdf asdf asdf sdere",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text("11:24"), Icon(Icons.done)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
