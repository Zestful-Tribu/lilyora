import 'package:flutter/material.dart';
import 'package:lilyora/components/appbar.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/components/flower_card.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/capture_screen.dart';
import 'package:lilyora/screens/home_screen.dart';
import 'package:lilyora/screens/navigation_screen.dart';
import 'package:lilyora/screens/search_screen.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "profile_screen_example";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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
      drawer: LilyoraDrawer(),
      appBar: lilyora_App_Bar(context),
      bottomNavigationBar: BottomAppBar(
        color: Primary_Color2,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Home',
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NavigationScreen.id);
                },
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NavigationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Primary_Color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Primary_Color,
                        image: DecorationImage(
                          image: AssetImage("assets/name.jpg"),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Dani Daniels\n"
                        "danidaniels@gmail.com",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              content: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),
                    FlowerCard(),

                  ],

                ),
              ),
            );
          }),
    );
  }

}
