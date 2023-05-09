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
    body: Column(
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
                    fontSize: 17)),
                    SizedBox(width:80, height:0),
                    IconButton(
                      icon: Image.asset('assets/001-bin.png', width: 25,height: 25),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/DageuHipFe_Review.jpg"),
                        width: 150,height: 150),
                    SizedBox(width:15, height:0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2023 대구 힙합 페스티벌", style: TextStyle(
                            fontWeight: FontWeight.bold ,fontSize: 16)),
                        menuDivider,
                        Text("너무 재밌어요!!", style: TextStyle(
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
                    Text("2023.04.25에 리뷰를 남겼어요.", style: TextStyle(
                        fontSize: 17)),
                    SizedBox(width:80, height:0),
                    IconButton(
                      icon: Image.asset('assets/001-bin.png', width: 25,height: 25),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/WhaleFe_Review.jpg"),
                        width: 150,height: 150),
                    SizedBox(width:15, height:0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("2023 울산 고래 축제", style: TextStyle(
                            fontWeight: FontWeight.bold ,fontSize: 16)),
                        menuDivider,
                        Text("너무 재밌어요!!", style: TextStyle(
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
