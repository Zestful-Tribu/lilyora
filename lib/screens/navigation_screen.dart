import 'package:flutter/material.dart';
import 'package:lilyora/components/appbar.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/constants.dart';
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Primary_Color,
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
        backgroundColor: Primary_Color2,

        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              color: Colors.white,),
            title: Text("Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
              color: Colors.white,),
            title: Text("Search",
              style: TextStyle(color: Colors.white),
              ),

          )
        ],
      ),

      appBar:  lilyora_App_Bar(context),
      body: _children[_currentIndex],
      drawer: LilyoraDrawer(),
    );
  }



  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


