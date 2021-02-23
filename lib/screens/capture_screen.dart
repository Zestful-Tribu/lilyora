
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'file:///D:/Dilan%20Files/IIT/Second%20Year%20-%20L5/SDGP%20project/flower%20recog.%20present%20its%20use/project-lilyora/sdgp_testing/lib/models/flower.dart';
import 'package:lilyora/screens/flower_screen.dart';



class CaptureScreen extends StatefulWidget {
  static String id = "capture_screen";
  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  File image;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getImage();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 300,
                  child: image == null ? Text("Image is not loaded") : Image.file(image),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  onPressed: (){
                    Navigator.pushNamed(context, FlowerScreen.id);
                  },
                  textColor: Colors.white,
                  color: Colors.purple,
                  elevation: 4.0,
                  child: Text(
                    "SCAN",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Future getImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if(pickedImage != null) {
        image = File(pickedImage.path);
      } else {
        print("no image is selected");
      }
    });
  }
}

