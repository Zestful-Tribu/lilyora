

import 'package:flutter/material.dart';
import 'package:lilyora/screens/profile_screen.dart';

import '../constants.dart';

AppBar lilyora_App_Bar(BuildContext context) {
  return AppBar(
    title: Text("Lilyora"),
    backgroundColor: Primary_Color2,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_active),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: () {
          Navigator.pushReplacementNamed(context, ProfileScreen.id);
        },
      ),
    ],
  );
}