import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            child: Text(
              "Home Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
      ),
    );
  }
}
