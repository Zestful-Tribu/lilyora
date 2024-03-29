import 'dart:core';
import 'dart:math';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/components/scrolling_small_flowers_horizontal.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/search_screen.dart';
import 'package:lilyora/utils/fire_storage.dart';

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

class _HomePageState extends State<HomePage> {
  final flowers = [
    "Anthurium",
    "Bell flower",
    "Calendular",
    "Caliandra",
    "Cannas",
    "Cardinals Guard",
    "Chess flower",
    "Cleome Hassleriana",
    "Colstsfoot",
    "Common Dandelion",
    "Creeping Buttercup",
    "Daffodil",
    "Daisy",
    "Dandelion",
    "Golden Penda",
    "Golden Shrimp",
    "Irises",
    "Jasmine",
    "Kapuru",
    "Leucantheum Maximum",
    "Malpighiaceae",
    "Manel",
    "Mountain Marigold",
    "Orchid Pink",
    "Orchid Yellow",
    "Pentas Lanceolata",
    "Phlox",
    "Phyllis African Marigold",
    "Plumbago Auriculata",
    "Rose",
    "Rose of venesuela",
    "Snowdrop",
    "Sunflower",
    "Tanaman Hias Bunga Pink Kasturi",
    "Tiger Lily",
    "Viola",
    "Wedelia",
    "Wild Pansy",
    "Willowleaf Angelon",
    "Willowleaf Angelon(purple)",
    "Wood Anemone",
    "Yellow Cosmos"
  ];

  final popularFlowers = [
    "Sunflower",
    "Tiger Lily",
    "Jasmine",
    "Anthurium",
    "Manel",
  ];

  var dbRefs;
  var dbRefs2;
  var rand = new Random();
  String imageFromFire; // for the do you know flower

  // images -> importance of flowers
  String cosmeticImg;
  String decorativeImg;
  String edibilityImg;
  String ecoImg;

  // flower urls
  List<String> flowerURLs = new List();

  String randomFlowerString;
  Map<String, String> lists = new Map();
  String stringGenus = "N/A";
  String stringKingdom = "N/A";
  String stringFamily = "N/A";
  String flowerDesc = "N/A";

  bool openflowerDay = false;

  void getRandomFlower() {
    int rNum = rand.nextInt(5);
    randomFlowerString = popularFlowers[rNum];
  }

  void loadFirebaseStorage() {
    //lists.clear();
    dbRefs = FirebaseDatabase.instance
        .reference()
        .child(randomFlowerString.toLowerCase());
    dbRefs.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        print('Data : ${snapshot.value}');
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          lists[key] = values;
        });
      }
    });
  }

  Future<Widget> getImageFromStore(
      BuildContext context, String imageName) async {
    String img;
    await FireStorageService.loadImage(context, imageName).then((value) {
      img = value.toString();
    });
    setState(() {
      imageFromFire = img;
    });
  }

  Future<Widget> getImagesForImportance(BuildContext context, String cosmetic,
      String decorative, String edibility, String ebenefit) async {
    String cos;
    String dec;
    String edib;
    String eco;

    await FireStorageService.loadHomeImage(context, cosmetic).then((value) {
      cos = value.toString();
    });
    await FireStorageService.loadHomeImage(context, edibility).then((value) {
      edib = value.toString();
    });
    await FireStorageService.loadHomeImage(context, decorative).then((value) {
      dec = value.toString();
    });
    await FireStorageService.loadHomeImage(context, ebenefit).then((value) {
      eco = value.toString();
    });
    setState(() {
      cosmeticImg = cos;
      decorativeImg = dec;
      edibilityImg = edib;
      ecoImg = eco;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getRandomFlower();
      loadFirebaseStorage();
      getImageFromStore(context, "${randomFlowerString.toLowerCase()}.jpg");
      getImagesForImportance(context, "cosmetic.jpg", "decoration.jpg",
          "edibility.jpg", "eco.jpg");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      openflowerDay = !openflowerDay;
      stringGenus = lists['genus'];
      stringFamily = lists['family'];
      stringKingdom = lists['kingdom'];
      flowerDesc = lists['description'];
    });

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                //test com
                ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10.0),
              padding: EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                "A flower to know",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 10.0,

                      //borderRadius: BorderRadius.circular(0),
                    ),
                  ],
                  color: Primary_Color),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(3.0, 3.0),
                                blurRadius: 5.0,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: imageFromFire != null
                                  ? NetworkImage(imageFromFire)
                                  : AssetImage("assets/lilyora logo png.png"),
                              fit: BoxFit.fill,
                            )),
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
                                    "$randomFlowerString",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Genus: $stringGenus\n" +
                                      "Family: $stringFamily\n" +
                                      "Kindgdom: $stringKingdom",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
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
                      "${flowerDesc}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Flower Structure",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 300.0,
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/flower_structure.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 10.0,

                    //borderRadius: BorderRadius.circular(0),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Importance of flowers",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,

                  //borderRadius: BorderRadius.circular(0),
                ),
              ], color: Primary_Color),
              child: Column(
                children: [
                  Container(
                    // image
                    height: 200.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: ecoImg != null
                            ? NetworkImage(ecoImg)
                            : AssetImage("assets/lilyora logo png.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    // descriptions
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Environmental Benefit",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,

                  //borderRadius: BorderRadius.circular(0),
                ),
              ], color: Primary_Color),
              child: Column(
                children: [
                  Container(
                    // image
                    height: 200.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: edibilityImg != null
                            ? NetworkImage(edibilityImg)
                            : AssetImage("assets/lilyora logo png.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    // descriptions
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Edibility (Edible for consumption)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,

                  //borderRadius: BorderRadius.circular(0),
                ),
              ], color: Primary_Color),
              child: Column(
                children: [
                  Container(
                    // image
                    height: 200.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: cosmeticImg != null
                            ? NetworkImage(cosmeticImg)
                            : AssetImage("assets/lilyora logo png.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    // descriptions
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Used in cosmetics",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 20, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                BoxShadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 10.0,

                  //borderRadius: BorderRadius.circular(0),
                ),
              ], color: Primary_Color),
              child: Column(
                children: [
                  Container(
                    // image
                    height: 200.0,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: decorativeImg != null
                            ? NetworkImage(decorativeImg)
                            : AssetImage("assets/lilyora logo png.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    // descriptions
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Used in Decorations",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text flowerDet() {
    if (openflowerDay) {
      return Text(
        "Genus: $stringGenus\n" +
            "Family: $stringFamily\n" +
            "Kindgdom: $stringKingdom",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text("Tap to display flower info");
    }
  }
}
