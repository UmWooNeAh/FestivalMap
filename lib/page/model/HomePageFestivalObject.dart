import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageFestivalObject extends StatefulWidget {
  const HomePageFestivalObject({
    Key? key, required this.festivalTitle, required this.festivalDescription,
  }) : super(key: key);
  final String festivalTitle;
  final String festivalDescription;

  @override
  State<HomePageFestivalObject> createState() => _HomePageFestivalObjectState();
}

class _HomePageFestivalObjectState extends State<HomePageFestivalObject> {
  late int Star, Bookmark;
  Image selectedStar       = Image.asset("assets/selectedStar.png",       height: 20, fit: BoxFit.fitHeight,);
  Image unselectedStar     = Image.asset("assets/unselectedStar.png",     height: 20, fit: BoxFit.fitHeight,);
  Image selectedBookmark   = Image.asset("assets/selectedBookmark.png",   height: 20, fit: BoxFit.fitHeight,);
  Image unselectedBookmark = Image.asset("assets/unselectedBookmark.png", height: 20, fit: BoxFit.fitHeight,);
  late Image StarState, BookmarkState;

  @override
  void initState(){
    super.initState();

    Star           = 1;
    Bookmark       = 1;
    StarState      = unselectedStar;
    BookmarkState  = unselectedBookmark;
  }

  @override
  Widget build(BuildContext context) {
    String title       = widget.festivalTitle;
    String Description = widget.festivalDescription;

    return Row(
      children: [

        Container(
          height: 150, width: 170,
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset("assets/DaeguHipFe_Poster.png", fit: BoxFit.fitHeight,),
          ),
        ),

        Expanded(
          child : Container(
            height: 150, margin: EdgeInsets.fromLTRB(0,0,20,0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),
                ),

                Container(
                  height: 90,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(Description),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            Star = Star * -1;
                            StarState = Star == 1 ? unselectedStar : selectedStar;
                          });
                        },
                        child: StarState,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text("1234"),),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Bookmark *= -1;
                          BookmarkState = Bookmark == 1 ? unselectedBookmark : selectedBookmark;
                        });
                      },
                      child: BookmarkState,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text("1234"),),
                  ],
                ),
              ],
            ),
          ),
        ),

      ],

    );
  }

}
