import 'package:flutter/material.dart';

class RegisterSignin extends StatefulWidget {
  static String id = "register_signin";
  @override
  _RegisterSigninState createState() => _RegisterSigninState();
}

class _RegisterSigninState extends State<RegisterSignin> {
  String _password;

  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email"
                      ),
                      onChanged: (value) {
                        _email = value.trim();
                      },
                    ),
                  ),
                  Container(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (value) {
                        _password = value.trim();
                      },
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      child: Text("Register"),
                      onPressed: (){

                      },
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      child: Text("Sign in"),
                      onPressed: (){

                      },
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );;
  }
}

