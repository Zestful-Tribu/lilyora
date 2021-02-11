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
  String dynamicDefinition;
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
                    color: Colors.red,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
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
                height:110 ,
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton(
                          hint: Text("Cosmetic"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          isExpanded: true,
                          value:valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              value:valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                height:110 ,
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton(
                          hint: Text("Decarative"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          isExpanded: true,
                          value:valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              value:valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()
                      ),
                    ),
                  ),
                ),

              ),
              Container(
                height:110,
                child: Container(
                  margin:EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        color: Colors.white,

                      )

                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DropdownButton(
                          hint: Text("Edibility"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down_circle),
                          isExpanded: true,
                          value:valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              value:valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()
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