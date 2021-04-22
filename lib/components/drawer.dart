import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/capture_screen.dart';
import 'package:lilyora/screens/navigation_screen.dart';
import 'package:lilyora/screens/profile_screen.dart';

class LilyoraDrawer extends StatelessWidget {

  final auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Primary_Color2,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 101,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/user.png"
                          ),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text('Unknown', style: TextStyle(fontSize: 22, color: Colors.white),),
                  OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: Text(
                      "Log out!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: (){
                      auth.signOut();
                    },
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile", style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, ProfileScreen.id);
            },
          ),

          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Capture", style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, CaptureScreen.id);
            },
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home", style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, NavigationScreen.id);
            },
          ),
        ],
      ),

    );
    }
      /**
       * git add .
       * git branch -M sidemenu
       * git push -u origin sidemenu
       */

}