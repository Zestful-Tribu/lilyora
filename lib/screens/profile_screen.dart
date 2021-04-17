import 'package:flutter/material.dart';
import 'package:lilyora/components/drawer.dart';

class ProfileScreen extends StatelessWidget {
  static String id = "profile_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LilyoraDrawer(),
      appBar:  AppBar(
        title: Text("Lilyora"),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(child: Text("Profile screen")),
    );
  }
}
