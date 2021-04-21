

import 'dart:io';

import 'package:dio/dio.dart';
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
  String dynamicDefinition;
  String dynamicDefinition1;
  bool openMedical = false;
  bool openCosmetic = false;
  bool open = false;
  bool open1 = false;

  String result = "Flower";

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

    Dio dio = new Dio();
    await dio
      .post("http://10.0.2.2:5000/predict", data: formData)
      .then((response){
        print(response);
        setState(() {
          result = response.data;
        });
        print(result);
    })
    .catchError((error) => print(error));
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
                                      open1 = !open1;
                                      if(open1 == true){
                                        dynamicDefinition1 = "A rose is a woody "
                                            "perennial flowering plant of the "
                                            "genus Rosa, in the family Rosaceae, "
                                            "or the flower it bears. ... They form "
                                            "a group of plants that can be erect"
                                            " shrubs, climbing, or trailing, with "
                                            "stems that are often armed with sharp prickles.";
                                      }else{
                                        dynamicDefinition1 = null;
                                      }

                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: dynamicDefinition1 == null ? null : Text("$dynamicDefinition1"),
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