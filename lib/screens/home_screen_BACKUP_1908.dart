import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      body: Center(
          child: Container(
            child: Text(
              "Home Page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
      ),
    );
=======
    return HomePage();
>>>>>>> 98cef0a6882d1435272aef901f432f3a463992e1
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
      appBar: AppBar(
        backgroundColor: Color(0xFF822659),
        title: Text('Lilyora'
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_outlined),
            onPressed: () => {},),
          IconButton(icon: Icon(Icons.account_circle_outlined),
            onPressed: () => {},),
        ],
        leading: Icon(Icons.menu),

      ),
      bottomNavigationBar: BottomNavigationBar
        (items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(

          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.camera),
          title: Text('Capture'),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search),
          title: Text('Search'),
        ),
      ],
      ),
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

