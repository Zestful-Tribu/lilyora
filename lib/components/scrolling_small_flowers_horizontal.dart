import 'package:flutter/material.dart';

class smallFlowerImg extends StatelessWidget {
  const smallFlowerImg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.teal,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
                "assets/tulip flower.png"
            ),
            fit: BoxFit.fill,
          )
      ),
    );
  }
}
