import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static String id = "search_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Search Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
