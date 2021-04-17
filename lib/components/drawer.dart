import 'package:flutter/material.dart';

class LilyoraDrawer extends StatelessWidget {
  const LilyoraDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/name.jpg"
                          ),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text('Dani Daniels', style: TextStyle(fontSize: 22, color: Colors.white),),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile", style: TextStyle(fontSize: 18),),
            onTap: null,
          ),

          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Capture", style: TextStyle(fontSize: 18),),
            onTap: null,
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