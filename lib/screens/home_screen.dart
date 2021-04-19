import 'package:flutter/material.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/components/scrolling_small_flowers_horizontal.dart';
import 'package:lilyora/constants.dart';
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
              //test commit
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                "Popular flowers   ---------------------------",
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
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                "Flower of the day   -------------------------",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(30),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Color(0xFF56C596),
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
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/roseflower.jpg"
                              ),
                              fit: BoxFit.fill,
                            )
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

                                width: MediaQuery.of(context).size.height / 3,

                                decoration: BoxDecoration(

                                  border: Border(
                                    bottom: BorderSide(
                                      color: Primary_Color,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Text(

                                      "Rose Flower",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
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
                    padding: EdgeInsets.only(top: 20),
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
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                "Recently searched  -------------------------",
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

