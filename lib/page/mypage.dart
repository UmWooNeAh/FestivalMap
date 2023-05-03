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
      indent: 20,
      endIndent: 20,
      color: firstColor,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: thirdColor,
        title: Text("My Page", style: TextStyle(color: firstColor,),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.asset("assets/001-smile.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("조우석 님",),
                ),
                ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
              ],
            ),
            menuDivider,
            Row(
              children: [
                Image.asset("assets/006-bookmark-1.png"),
                Text("내가 어떤 리뷰를 썼을까요?"),
              ],
            ),
            menuDivider,
          ]
      ),
    );
  }
}
