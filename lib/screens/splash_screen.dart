import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lilyora/constants.dart';


class SplashScreen extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 // @override
  //void initState() {
  //  super.initState();


  //  Timer(Duration(seconds: 3), ()=>)

 // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo.png', height: 100.0,),
          SizedBox(height: 30.0),

          SpinKitFadingCube(color: Primary_Color2,)
        ],
      ),

    );
  }
}