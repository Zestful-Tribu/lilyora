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
              icon: Icon(Icons.notifications_active_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                child: Container(
                  margin:EdgeInsets.all(75.0),
                  height: 200,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin:EdgeInsets.all(5.0),
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
                          hint: Text("Medical Values"),
                          dropdownColor: Colors.grey,
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
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
                child: Container(
                  margin:EdgeInsets.all(5.0),
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
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
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
                child: Container(
                  margin:EdgeInsets.all(5.0),
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
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
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
                child: Container(
                  margin:EdgeInsets.all(5.0),
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
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
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

              )

            ],
          ),
        )
    );

  }
}


