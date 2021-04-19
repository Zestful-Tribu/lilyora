import 'package:flutter/material.dart';

class smallFlowerImg extends StatelessWidget {

  const smallFlowerImg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
                "assets/roseflower.jpg"
            ),
            fit: BoxFit.fill,
          )
      ),
    );
  }
}
