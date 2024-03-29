import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lilyora/screens/capture_screen.dart';
import 'package:lilyora/screens/flower_info.dart';
import 'package:lilyora/screens/flower_screen.dart';
import 'package:lilyora/screens/getting_started.dart';
import 'package:lilyora/screens/home_screen.dart';
import 'package:lilyora/screens/intro_screen.dart';
import 'package:lilyora/screens/login_screen.dart';
import 'package:lilyora/screens/navigation_screen.dart';
import 'package:lilyora/screens/profile_screen.dart';
import 'package:lilyora/screens/regsign_screen.dart';
import 'package:lilyora/screens/search_screen.dart';
import 'package:lilyora/screens/signup_screen.dart';
import 'package:lilyora/screens/test_screen.dart';
import 'package:lilyora/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,

      ),
      home: RegisterSignin(),
      routes: {
        RegisterSignin.id: (context) => RegisterSignin(),
        LoginScreen.routeName: (context) => LoginScreen(),
        NavigationScreen.id: (context) => NavigationScreen(),
        IntroScreen.id: (context) => IntroScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        CaptureScreen.id: (context) => CaptureScreen(),
        SearchScreen.id: (context) => SearchScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        GettingStarted.id: (context) => GettingStarted(),
        FlowerScreen.id: (context) => FlowerScreen(),
        FlowerInfo.id: (context) => FlowerInfo(),
      },
    );
  }
}

