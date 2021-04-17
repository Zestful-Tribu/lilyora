import 'package:flutter/material.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/components/scrolling_small_flowers_horizontal.dart';
import 'package:lilyora/screens/search_screen.dart';

import 'capture_screen.dart';

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
      body: SafeArea(
        child: ListView(
          children: [
            Container(

            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Popular flowers",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 70.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Flower of the day",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(20),

                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 100,
                          width: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                width: MediaQuery.of(context).size.height / 3,

                                decoration: BoxDecoration(

                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                    "Rose Flower"
                                ),
                              ),
                              Container(

                                child: Text(
                                    "Genus: Rosa L\n" +
                                        "Family: Rosaceae\n"+
                                        "Kindgdom: Platae"
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        "A rose is awoody perennial asdfa aiosdfhosdhf dahsdfoauh sdfoahda dfoh"
                            "asdfha isdufhao dfadfojaosdfhao dadfaidfh "
                            "adfhaodfiaoid asdf aisdfha;o as"
                            "aa oisdfhaosh a;s dfhsodhfo sdfpa sdfp"
                            "aoisdf aidf"
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Recently searched",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 70.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                  smallFlowerImg(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }


}

