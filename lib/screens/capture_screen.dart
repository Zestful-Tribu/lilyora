
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lilyora/components/appbar.dart';
import 'package:lilyora/components/drawer.dart';
import 'package:lilyora/screens/flower_screen.dart';



class CaptureScreen extends StatefulWidget {
  static String id = "capture_screen";
  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  File image;
  final picker = ImagePicker();

  PickedFile pickedGalleyImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   captureImage();
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LilyoraDrawer(),
      appBar:  lilyora_App_Bar(),
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  height: 400,
                  width: 300,
                  child: image == null ? Text("Image is not loaded") : Image.file(image),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          setState(() {
                            galleryImage();
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.purple,
                        elevation: 25.0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.photo_library
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "GALLERY",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(20),
                        onPressed: (){
                          setState(() {
                            captureImage();
                          });
                        },
                        textColor: Colors.white,
                        color: Colors.purple,
                        elevation: 25.0,
                        child:  Row(
                          children: [
                            Icon(
                                Icons.camera
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "CAPTURE",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  child: RaisedButton(
                    padding: EdgeInsets.all(20),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlowerScreen(pickedGalleryImage: pickedGalleyImage,)
                        )
                      );
                    },
                    textColor: Colors.white,
                    color: Colors.purple,
                    elevation: 25.0,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "IDENTIFY",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  Future captureImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print("no image is captured");
      }
    });
  }

  Future galleryImage() async {
    pickedGalleyImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedGalleyImage != null) {
        image = File(pickedGalleyImage.path);
      } else {
        print("no image is selected");
      }
    });
  }
}

