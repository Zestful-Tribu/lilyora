

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lilyora/components/appbar.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/constants.dart';

class FlowerScreen extends StatefulWidget {
  static String id = "flower_screen";

  PickedFile pickedGalleryImage;
  PickedFile pickedCaptureImage;
  FlowerScreen({this.pickedGalleryImage});

  @override
  _FlowerScreenState createState() => _FlowerScreenState();

}

class _FlowerScreenState extends State<FlowerScreen> {

  File image;
  String valueChoose;
  List listItem = [
    "Item1","Item2","Item3","Item4",
  ];
  String dynamicDefinitionMedical;
  String dynamicDefinitionCosmetic;
  String dynamicDefinitionEdibility;
  String dynamicDefinitionDecorative;
  String dynamicDefinitionEnv;
  bool openMedical = false;
  bool openCosmetic = false;
  bool openEdibility = false;
  bool openDecorative = false;
  bool openEnv = false;

  String result = "anthurium";

  var dbRefs;


  @override
  void initState() {
    // TODO: implement initState
    galleyImage();
    setState(() {
      uploadImage(image);
    });
  }



  Future galleyImage() async {
    setState(() {
      if(widget.pickedGalleryImage != null) {
        image = File(widget.pickedGalleryImage.path);
      } else {
        print("no image is selected");
      }
    });
  }

  uploadImage(File file) async {
    String imgFileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'image':
      await MultipartFile.fromFile(file.path, filename: imgFileName),
    });

    // local url -> http://10.0.2.2:5000/predict
    Dio dio = new Dio();
    await dio
      .post("http://10.0.2.2:5000/predict", data: formData)
      .then((response){
        print(response);
        setState(() {
          result = response.data;
          loadFirebaseStorage();
        });
        print(result);
    })
    .catchError((error) => print(error));
  }

  Map<String, String> lists = new Map();

  void loadFirebaseStorage() {
    lists.clear();
    dbRefs = FirebaseDatabase.instance.reference().child(result.toLowerCase());
    dbRefs.once().then((DataSnapshot snapshot) {
      if(snapshot.value != null){
        print('Data : ${snapshot.value}');
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, values) {
          lists[key] = values;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!

          },
          label: const Text('Add to favourites'),
          icon: const Icon(Icons.favorite),
          backgroundColor: Primary_Color2,
        ),
        drawer: LilyoraDrawer(),
        appBar: lilyora_App_Bar(context),
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
                    shape: BoxShape.circle,
                    image: DecorationImage(

                      image:image != null ? FileImage(image) : AssetImage("assets/roseflower.jpg"),
                      fit: BoxFit.fill,
                    ),
                    //color: Colors.white,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                        result,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
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
                        color: Primary_Color,

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
                                        dynamicDefinitionMedical = lists["medical"];

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
                        color: Primary_Color,

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
                                        dynamicDefinitionCosmetic = lists["cosmetic"];
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
                        color: Primary_Color,

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
                                      openEdibility = !openEdibility;
                                      if(openEdibility == true){
                                        dynamicDefinitionEdibility = lists["edibility"];
                                      }else{
                                        dynamicDefinitionEdibility = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinitionEdibility == null ? null : Text("$dynamicDefinitionEdibility"),
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
                        color: Primary_Color,

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
                                Text("Decorative Uses",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      openDecorative = !openDecorative;
                                      if(openDecorative == true){
                                        dynamicDefinitionDecorative = lists["decorative"];
                                      }else{
                                        dynamicDefinitionDecorative = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinitionDecorative == null ? null : Text("$dynamicDefinitionDecorative"),
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
                        color: Primary_Color,

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
                                Text("Environmental benefit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down_circle),
                                  onPressed: () {
                                    setState(() {
                                      openEnv = !openEnv;
                                      if(openEnv == true){
                                        dynamicDefinitionEnv = lists["e-benefit"];
                                      }else{
                                        dynamicDefinitionEnv = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinitionEnv == null ? null : Text("$dynamicDefinitionEnv"),
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ),

              SizedBox(
                height: 60,
              )

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