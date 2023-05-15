import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/CustomNavigationBar.dart';

String UserName = "조우석";
Image profileImage = Image.asset("assets/001-smile.png");

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // primary color declaration
    final Color firstColor = Colors.black;
    final Color secondColor = Colors.grey;
    final Color thirdColor = Colors.white;

    Divider menuDivider = Divider(
      thickness: 1,
      indent: 30,
      endIndent: 30,
      color: Colors.grey,
    );


    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: thirdColor,
        title: Text("마이페이지", style: TextStyle(
            fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body:
          Stack(
            children: [
              Center(
                child: Column(
                    children: [
                      SizedBox(width: 0,height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: profileImage,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(UserName+ "\t\t님", style: TextStyle(
                              fontSize: 25)),
                          ElevatedButton(
                            onPressed: (){
                              Get.toNamed("EditProfile");
                            },
                            child: Image(image: AssetImage("assets/MyPage_edit.png"),
                                width: 20,height: 20),
                            style: ElevatedButton.styleFrom(
                              primary:Colors.transparent,
                              elevation: 0.0,
                              shadowColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 0,height: 40),
                      menuDivider,
                      ElevatedButton(
                        onPressed: (){
                          Get.toNamed("ReviewList");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width:30, height:0),
                            Image(image: AssetImage("assets/MyPage_message.png")
                                ,width: 50,height: 50),
                            SizedBox(width:20, height:0),
                            Text("내가 어떠한 리뷰를 썼을까요?", style: TextStyle(
                                fontSize: 20, color: Colors.black)
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:Colors.transparent,
                          elevation: 0.0,
                          shadowColor: Colors.white,
                        ),
                      ),
                      menuDivider,
                    ]
                ),
              ),

              Positioned(child: BottomNavBar(), bottom: 0, left: 0,),
            ],
          ),
      );
  }
}
