import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lilyora/components/appbar.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/utils/fire_storage.dart';

class FlowerInfo extends StatefulWidget {
  static String id = "flower_info";
  String result;
  FlowerInfo({this.result});

  @override
  _FlowerInfoState createState() => _FlowerInfoState();
}

class _FlowerInfoState extends State<FlowerInfo> {
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


  var dbRefs;

  String imageFromFire;

  Map<String, String> lists = new Map();

  void loadFirebaseStorage() {
    lists.clear();
    dbRefs = FirebaseDatabase.instance.reference().child(widget.result.toLowerCase());
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

  Future<Widget> getImageFromStore(BuildContext context, String imageName) async {
    String img;
    await FireStorageService.loadImage(context, imageName).then((value){
      img = value.toString();
    });
    setState(() {
      imageFromFire = img;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    loadFirebaseStorage();
    getImageFromStore(context, '${widget.result.toLowerCase()}.jpg');
    super.initState();
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
                  margin:EdgeInsets.only(left:75.0,top:20.0,right:75.0,bottom:10.0),
                  height: 200,
                  width: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(

                      image:imageFromFire != null ? NetworkImage(imageFromFire) : AssetImage("assets/roseflower.jpg"),
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
                      widget.result,
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
