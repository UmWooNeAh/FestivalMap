import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  const CategoryButton({Key? key, required this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text(categoryName, textAlign: TextAlign.center, style: TextStyle(color: Colors.black),),
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
            backgroundColor: Color(0xffE8E5EB),
        ),
      )
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("카테고리", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '주변의 축제를 검색해 보세요!',
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("SearchList");
                      //검색 버튼 클릭시 축제 목록 보여주기
                    },
                    child: Image.asset("assets/search.png", height:25, width:25,),
                    style: ElevatedButton.styleFrom(
                      primary:Colors.transparent,
                      elevation: 0.0,
                      shadowColor: Colors.white,
                    )
                ),
              ],
            ),
          ),
          Container(
            child: Text("계절", style: TextStyle(fontWeight: FontWeight.bold),),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:10, height: 0,),
              CategoryButton(categoryName: "봄"),
              CategoryButton(categoryName: "여름"),
              CategoryButton(categoryName: "가을"),
              CategoryButton(categoryName: "겨울"),
            ],
          ),
          Divider(thickness: 0.5, indent: 10, endIndent: 10, color: Colors.black),
          Container(
            child: Text("지역", style: TextStyle(fontWeight: FontWeight.bold),),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(width:10, height: 0,),
                CategoryButton(categoryName: "서울"),
                CategoryButton(categoryName: "경기"),
                CategoryButton(categoryName: "대구"),
                CategoryButton(categoryName: "부산"),
                CategoryButton(categoryName: "울산"),
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width:10, height: 0,),
                  CategoryButton(categoryName: "경북"),
                ],
              ),
              Divider(thickness: 0.5, indent: 10, endIndent: 10, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
