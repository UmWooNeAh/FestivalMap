import 'package:festivalmap/class/FireService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePageFestivalObject extends StatefulWidget {
  const HomePageFestivalObject({Key? key, required this.festivalName,}) : super(key: key);
  final String festivalName;

  @override
  State<HomePageFestivalObject> createState() => _HomePageFestivalObjectState();
}

class _HomePageFestivalObjectState extends State<HomePageFestivalObject> {
  Image Star               = Image.asset("assets/selectedStar.png",       height: 20, fit: BoxFit.fitHeight,);
  Image selectedBookmark   = Image.asset("assets/selectedBookmark.png",   height: 20, fit: BoxFit.fitHeight,);
  Image unselectedBookmark = Image.asset("assets/unselectedBookmark.png", height: 20, fit: BoxFit.fitHeight,);
  int Bookmark = 1;
  late Image  BookmarkState;
  late String fName;

  @override
  void initState(){
    super.initState();

    BookmarkState  = unselectedBookmark;
    fName          = widget.festivalName;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireService().readFestByName(fName),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData == false){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          return Column(
            children: [
              Row(
                children: [
                  // festival image
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                      onPressed: (){Get.toNamed("/FestivalDetailPage", arguments: fName);},
                      child: Container(
                        height: 150, width: 170,
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/img_1.png", fit: BoxFit.fitHeight,),
                        ),
                      ),
                  ),

                  //information sector
                  Expanded(
                    child : Container(
                      height: 150, margin: EdgeInsets.fromLTRB(0,0,20,0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // festival name, description, star, bookmark
                      child: Column(
                        children:[
                          // festival name
                          Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(snapshot.data.fName, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                          ),

                          //festival description
                          Container(
                            height: 90,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(snapshot.data.fName),
                          ),

                          //festival star, bookmark
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Star,
                              Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text(snapshot.data.fStars.toString()),),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    Bookmark *= -1;
                                    BookmarkState = Bookmark == 1 ? unselectedBookmark : selectedBookmark;
                                  });
                                },
                                child: BookmarkState,
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text(snapshot.data.fName),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

              ),
              // height between festival object
              Container(height: 10,),
            ],
          );
        }
      },
    ); // object return
  }

}
