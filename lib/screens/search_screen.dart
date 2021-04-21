 import 'package:flappy_search_bar/flappy_search_bar.dart';
 import 'package:flutter/material.dart';



class SearchScreen extends StatefulWidget {
  static String id = "search_screen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
  
}

class _SearchScreenState extends State<SearchScreen> {

  final flowers = [
    "Anthurium", "Bell flower", "Calendular", "Caliandra", "Cannas", "Cardinals Guard", "Chess flower",
    "Cleome Hassleriana", "Colstsfoot", "Common Dandelion", "Creeping Buttercup", "Daffodil", "Daisy", "Dandelion",
    "Golden Penda", "Golden Shrimp", "Irises", "Jasmine", "Kapuru", "Leucantheum Maximum",
    "Malpighiaceae", "Manel", "Mountain Marigold", "Orchid Pink", "Orchid Yellow", "Pentas Lanceolata", "Phlox",
    "Phyllis African Marigold", "Plumbago Auriculata", "Rose", "Rose of venesuela", "Snowdrop", "Sunflower",
    "Tanaman Hias Bunga Pink Kasturi", "Tiger Lily", "Viola", "Wedelia", "Wild Pansy", "Willowleaf Angelon", "Willowleaf Angelon(purple)",
    "Wood Anemone", "Yellow Cosmos"];

  var items = List<String>();


  @override
  void initState() {
    items.addAll(flowers);
    super.initState();
  }

  void filterSearchResult(String query){
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(flowers);
    if(query.isNotEmpty){
      List<String> dummyListData = List<String>();
      dummySearchList = dummySearchList.map((flower)=>flower.toLowerCase()).toList();
      dummySearchList.forEach((item) {
        if(item.contains(query)){
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;

    }
    else{
      setState(() {
        items.clear();
        items.addAll(flowers);
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        child: Column(
          children: <Widget>[
           Container(
             decoration: BoxDecoration(
               color: Colors.greenAccent,
               borderRadius: BorderRadius.circular(20),
             ),
             margin: EdgeInsets.all(20),
             height: 50,
             width: 450,
             //color: Colors.red,
             padding: const EdgeInsets.all(10.0),
             child: TextField(
               onChanged: (value){
                 filterSearchResult(value);
               },
               style:(
                   TextStyle(
                       color: Colors.black
                   )
               ),
               decoration: new InputDecoration(hintText: "Search here",
                 hintStyle:TextStyle(
                   color:Colors.black,
                 ),
                 suffixIcon: Icon(Icons.search)
               ),
             )
             ),
            Expanded(
              child:ListView.builder(
                shrinkWrap: true,
                itemCount:items.length,
                itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(5),
                  onTap: () {

                  },
                  leading:Container(
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
                  ),
                 title: Text('${items[index]}'),
                );
                })
            )
          ],
        )
        )
    );
  }
}

