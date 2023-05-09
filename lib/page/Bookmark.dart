import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}


class _BookmarkState extends State<Bookmark> {
  bool isPressed = false;
  bool isPressed2 = false;
  @override
  Widget build(BuildContext context) {
    Divider menuDivider = Divider(
      thickness: 1,
      color: Colors.grey,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        title: Text("북마크", style: TextStyle(
            fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(width:0, height: 40,),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10, height: 0),
                    Container(
                      width: 130, height:130,
                      child: Image(image: AssetImage("assets/DaeguHipFe_Poster.png"),),
                    ),
                    SizedBox(width:10, height:0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 170,
                              child: Text("2023 대구 힙합 페스티벌", style: TextStyle(
                                fontWeight: FontWeight.bold ,fontSize: 15)),
                            ),
                            //SizedBox(width: 10, height: 0),
                            IconButton(
                              icon: isPressed ? Image.asset("assets/selectedBookmark.png", width: 25,height: 25 ):Image.asset("assets/005-bookmark.png", width: 25,height: 25 ),
                              onPressed: () {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                              },
                            ),
                          ],
                        ),
                        menuDivider,
                        Text("-----", style: TextStyle(
                            fontSize: 13)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 10, height: 0),
                    Container(
                      width: 130, height:130,
                      child: Image(image: AssetImage("assets/WhaleFe_Poster.jpg"),),
                    ),
                    SizedBox(width:10, height:0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 170,
                              child: Text("2023 울산 고래 축제", style: TextStyle(
                                  fontWeight: FontWeight.bold ,fontSize: 15)),
                            ),
                            //SizedBox(width: 10, height: 0),
                            IconButton(
                              icon: isPressed2 ? Image.asset("assets/selectedBookmark.png", width: 25,height: 25 ):Image.asset("assets/005-bookmark.png", width: 25,height: 25 ),
                              onPressed: () {
                                setState(() {
                                  isPressed2 = !isPressed2;
                                });
                              },
                            ),
                          ],
                        ),
                        menuDivider,
                        Text("-----", style: TextStyle(
                            fontSize: 13)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
