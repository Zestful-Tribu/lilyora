import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lilyora/screens/navigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterSignin extends StatefulWidget {
  static String id = "register_signin";
  @override
  _RegisterSigninState createState() => _RegisterSigninState();
}

class _RegisterSigninState extends State<RegisterSignin> {
  String _password;
  String _email;
  final auth = FirebaseAuth.instance;

  void setValuesToShared(String email, bool success) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("current_user");
    prefs.setString("current_user", email);
  }

  void removeValuedFromShared(String email) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("current_user");
  }

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
                        auth.createUserWithEmailAndPassword(email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationScreen()));

                        setValuesToShared(_email, true);
                      },
                    ),
                  ),
                  Container(
                    child: OutlinedButton(
                      child: Text("Sign in"),
                      onPressed: (){
                        auth.signInWithEmailAndPassword(email: _email, password: _password);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationScreen()));

                        setValuesToShared(_email, true);
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

