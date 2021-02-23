import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 200 ,
        color: Colors.grey,
        child: Padding(padding: EdgeInsets.only(top: 100.0),),
        margin: EdgeInsets.all(15.0),
      ),
    );
    throw UnimplementedError();
  }


}

