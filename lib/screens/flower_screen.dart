import 'package:flutter/material.dart';

class FlowerScreen extends StatelessWidget {
  static String id = "flower_screen";
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  String valueChoose;
  List listItem = [
    "Item1","Item2","Item3","Item4",
  ];
  String dynamicDefinitionMedical;
  String dynamicDefinitionCosmetic;
  String dynamicDefinition;
  bool openMedical = false;
  bool openCosmetic = false;
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text("Lilyora"),
          backgroundColor: Colors.deepPurple,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                child: Container(
                  margin:EdgeInsets.only(left:75.0,top:75.0,right:75.0,bottom:10.0),
                  height: 200,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("assets/tulip flower.png"),
                    ),
                    //color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text("Tulip"),
                    //color: Colors.green,
                    //height: 50,
                    //width: 100,
                    //alignment: Alignment.center,
                    margin:EdgeInsets.only(left:10.0,top:10.0,right:10.0,bottom: 10.0),
                  ),
                ],
              ),
              Container(
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Medical Uses",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      openMedical = !openMedical;
                                      if(openMedical == true){
                                        dynamicDefinitionMedical = "Tulip flowers are known to be an excellent poultice for insect "
                                            "bites, bee stings, burns, and rashes on the skin, as it "
                                            "gave quick relief with a soothing effect. Warm up 2-4 "
                                            "flowers in hot water. Dip a towel in the hot water and drop "
                                            "the petals of the flowers into the towel. Roll the towel to "
                                            "crush the leaves. Apply the crushed petals to area where "
                                            "there is skin rash, bee sting or insect bite to find quick "
                                            "relief from the irritation. Hold the leaves on the place for "
                                            "10 minutes using the hot towel.";

                                      }else{
                                        dynamicDefinitionMedical = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinitionMedical == null ? null : Text("$dynamicDefinitionMedical"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cosmetic Uses",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      openCosmetic = !openCosmetic;
                                      if(openCosmetic == true){
                                        dynamicDefinitionCosmetic = "A rose is a woody "
                                            "perennial flowering plant of the "
                                            "genus Rosa, in the family Rosaceae, "
                                            "or the flower it bears. ... They form "
                                            "a group of plants that can be erect"
                                            " shrubs, climbing, or trailing, with "
                                            "stems that are often armed with sharp prickles.";
                                      }else{
                                        dynamicDefinitionCosmetic = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinitionCosmetic == null ? null : Text("$dynamicDefinitionCosmetic"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Edibility",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      open = !open;
                                      if(open == true){
                                        dynamicDefinition = "A rose is a woody "
                                            "perennial flowering plant of the "
                                            "genus Rosa, in the family Rosaceae, "
                                            "or the flower it bears. ... They form "
                                            "a group of plants that can be erect"
                                            " shrubs, climbing, or trailing, with "
                                            "stems that are often armed with sharp prickles.";
                                      }else{
                                        dynamicDefinition = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinition == null ? null : Text("$dynamicDefinition"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Decarative Uses",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      open = !open;
                                      if(open == true){
                                        dynamicDefinition = "A rose is a woody "
                                            "perennial flowering plant of the "
                                            "genus Rosa, in the family Rosaceae, "
                                            "or the flower it bears. ... They form "
                                            "a group of plants that can be erect"
                                            " shrubs, climbing, or trailing, with "
                                            "stems that are often armed with sharp prickles.";
                                      }else{
                                        dynamicDefinition = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinition == null ? null : Text("$dynamicDefinition"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ),

            ],
          ),
        )
    );

  }
}


// DropdownButton(
// hint: Text("Medical Values"),
// dropdownColor: Colors.grey,
// icon: Icon(Icons.arrow_drop_down_circle),
// isExpanded: true,
// value:valueChoose,
// onChanged: (newValue){
// setState(() {
// valueChoose = newValue;
// });
// },
// items: listItem.map((valueItem){
// return DropdownMenuItem(
// value:valueItem,
// child: Text(valueItem),
// );
// }).toList()
// ),