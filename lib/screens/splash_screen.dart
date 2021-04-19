import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/navigation_screen.dart';


class SplashScreen extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 6), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen())));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            child: Image.asset('assets/logo.png',
              height: 200.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100.0),
            child: Text("Lilyora", style: TextStyle(color: Colors.black, fontSize: 50.0),),

          ),
          SizedBox(height: 30.0),

          SpinKitWave(color: Primary_Color2,)
        ],
      ),

    );
  }
}