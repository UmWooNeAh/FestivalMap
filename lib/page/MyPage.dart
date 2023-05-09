import 'package:flutter/material.dart';

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
          Center(
            child: Column(
              children: [
              SizedBox(width: 0,height: 30),
              Container(
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/001-smile.png"),
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("조우석\t\t님", style: TextStyle(
                    fontSize: 25)),
                SizedBox(width:10, height:0),
                ElevatedButton(
                  onPressed: (){},
                  child: Image(image: AssetImage("assets/MyPage_edit.png"),
                    width: 20,height: 20),
                  style: ElevatedButton.styleFrom(
                  primary:Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(width: 0,height: 40),
            menuDivider,
            ElevatedButton(
              onPressed: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:30, height:0),
                  Image(image: AssetImage("assets/MyPage_message.png")
                    ,width: 50,height: 50),
                  SizedBox(width:50, height:0),
                  Text("내가 어떠한 리뷰를 썼을까요?", style: TextStyle(
                    fontSize: 20, color: Colors.black)
                  ),
                ],
            ),
            style: ElevatedButton.styleFrom(
              primary:Colors.transparent,
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
            ),
            menuDivider,
          ]
        ),
      ),
      );
  }
}
