import 'package:flutter/material.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/screens/capture_screen.dart';
import 'package:lilyora/screens/search_screen.dart';

import 'home_screen.dart';

class NavigationScreen extends StatefulWidget {
  static String id = "navigation";
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LilyoraDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushNamed(context, CaptureScreen.id);
        },
        tooltip: 'capture',
        child: Icon(
          Icons.camera,
          color: Colors.white,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          )
        ],
      ),

      appBar:  AppBar(
        title: Text("Lilyora"),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
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
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


