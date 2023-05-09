import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {
    Divider menuDivider = Divider(
      thickness: 1,
      indent: 5,
      endIndent: 5,
      color: Colors.grey,
    );
    return Scaffold(
        appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {},
        ),
        title: Text("리뷰목록", style: TextStyle(
        fontSize: 20, color: Colors.black)
    ),
    centerTitle: true,
    ),
    body: Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                  children: [
                    Text("2023.04.27에 리뷰를 남겼어요.", style: TextStyle(
                    fontSize: 18)),
                    SizedBox(width:160, height:0),
                    IconButton(
                      icon: Image.asset('assets/001-bin.png'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary:Colors.transparent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                      ),
                   ),
                  ],
                ),
                menuDivider,
              ],
            ),

          ),
        ],
      )
    ),

  );
  }
}
