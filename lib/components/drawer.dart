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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/name.jpg"
                          ),
                          fit: BoxFit.fill
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
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