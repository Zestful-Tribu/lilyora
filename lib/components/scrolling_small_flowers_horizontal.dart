import 'package:flutter/material.dart';

class smallFlowerImg extends StatelessWidget {

  final String imageURL;
  final String flowerName;
  final Function onPress;

  const smallFlowerImg({
    Key key, this.imageURL, this.flowerName, this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Container(
        margin: EdgeInsets.only(left: 23.0),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(2.0,2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,

                //borderRadius: BorderRadius.circular(0),
              ),

            ],
            color: Colors.teal,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageURL != null ? NetworkImage(imageURL) : AssetImage("assets/flower.png"),
              fit: BoxFit.fill,
            ),
        ),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 105),
          child: Text(
            "$flowerName",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
