import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Post {
  final flowers = [
    "tulip",
    "daffodil",
    "poppy",
    "sunflower",
    "bluebell",
    "rose",
    "snowdrop",
    "cherry blossom",
    "orchid",
    "iris",
    "peony",
    "geranium",
    "lily",
    "lotus",
    "water lily",
    "dandelion",
    "hyacinth",
    "daisy"
  ];
}

class SearchScreen extends StatelessWidget {
  static String id = "search_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(),
        ),
      )
    );
  }
}
