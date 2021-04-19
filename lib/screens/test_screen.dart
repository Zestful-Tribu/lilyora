import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final dbRef = FirebaseDatabase.instance.reference().child("anthurium");


  @override
  Widget build(BuildContext context) {
    List lists = List();
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Demo"),
      ),
      body: FutureBuilder(
          future: dbRef.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              Map<dynamic, dynamic> values = snapshot.data.value;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new ListView.builder(
                  shrinkWrap: true,
                  itemCount: lists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("medical: " + lists[index]["medical"]),
                          Text("cosmetic: "+ lists[index]["cosmetic"]),
                          Text("ecobenefit: " +lists[index]["ecobenefit"]),
                        ],
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}