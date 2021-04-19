import 'package:flutter/material.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/roseflower.jpg"
                      ),
                        fit: BoxFit.fill,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.height / 3,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.height / 3,
                          child: Text(
                            "Rose Flower",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(

                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                              "This is a flower of srendib. flower of valentine"
                                  "the heart of sea, and the name of great graat"
                                  "flowers in the universe of flowers."
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
