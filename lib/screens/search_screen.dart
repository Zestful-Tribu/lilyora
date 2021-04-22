 import 'package:firebase_storage/firebase_storage.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:lilyora/constants.dart';
import 'package:lilyora/screens/flower_info.dart';
import 'package:lilyora/utils/fire_storage.dart';



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
  var imageList = List<String>();
  var imagesFromStore = new List();


  @override
  void initState() {
    items.addAll(flowers);
    setState(() {
      // setImageUrls();
    });

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
        // setImageUrls();
      });
      return;

    }
    else{
      setState(() {
        items.clear();
        items.addAll(flowers);
        // setImageUrls();
      });
    }
  }


  // void getImageFromStore(BuildContext context, String imageName) async {
  //   String img;
  //   await FireStorageService.loadImage(context, imageName).then((value){
  //     img = value.toString();
  //     imageList.add(img);
  //   });
  //   // return img;
  // }
  //
  // //getting the image urls
  // void setImageUrls(){
  //   // imagesFromStore.clear();
  //   imageList.clear();
  //   for(int i = 0; i < items.length; i++){
  //     getImageFromStore(context, '${items[i].toLowerCase()}.jpg');
  //     // imagesFromStore.add(imageUrl.toString());
  //   }
  // }

  Future<Widget> getImageFromFire(BuildContext context, String imageName) async {
    Image image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        child: Column(
          children: <Widget>[
           Container(
             decoration: BoxDecoration(
               color: Colors.transparent,
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
                       color: Colors.white,
                   )
               ),
               decoration: new InputDecoration(hintText: "Search here",
                 hintStyle:TextStyle(
                   color:Colors.black,
                   fontSize: 15,
                 ),
                 suffixIcon: Icon(Icons.search, color: Colors.black,)
               ),
             ),
             ),
            Expanded(
              child:ListView.builder(
                shrinkWrap: true,
                itemCount:items.length,
                itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlowerInfo(result: items[index]))
                    );
                  },
                  leading: FutureBuilder(
                    future: getImageFromFire(context, "${items[index].toLowerCase()}.jpg"),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            color: Colors.transparent,


                          ),


                          child: snapshot.data,

                        );

                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Primary_Color2,
                          ),
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Container();
                    },
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

 // Container(
 // height: 70,
 // width: 70,
 // decoration: BoxDecoration(
 // color: Colors.teal,
 // shape: BoxShape.circle,
 // image: DecorationImage(
 // image: AssetImage("assets/lilyora logo png.png"),
 // fit: BoxFit.fill,
 // )
 // ),
 // ),

