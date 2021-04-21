import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/navigation_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();


    Timer(Duration(seconds: 4), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationScreen())));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            margin: const EdgeInsets.only(top:80,bottom: 0.0),
            child: SvgPicture.asset("assets/lilyora logo svg.svg",
            height: 200,)
          ),
          Container(

            margin: const EdgeInsets.only(top: 0.0, bottom: 50),
            child: Text("Lilyora",
              style:GoogleFonts.lobster(fontSize: 45, color: Primary_Color2),
            ),

          ),
          SizedBox(height: 30.0),


          Container(
              margin: const EdgeInsets.only(top: 80.0),
              child: SpinKitThreeBounce(color: Primary_Color,)),

        /*  Container(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              "By",
              style: GoogleFonts.russoOne(fontSize: 20, color: Primary_Color2),
            ),
          ),
          Container(

            child: Text(
              "Zestful-Tribu",
              style: GoogleFonts.russoOne(fontSize: 20, color: Primary_Color2),
            ),
          ),*/

        ],

      ),


    );
  }
}