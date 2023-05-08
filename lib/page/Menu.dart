import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CategoryButton extends StatelessWidget {
  final String categoryName;
  const CategoryButton({Key? key, required this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(categoryName, textAlign: TextAlign.center),
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        backgroundColor: Color(0xE8E5EB),
      ),
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
        title: Container(alignment: Alignment.center, child: Text("카테고리"),
        ),
        backgroundColor: Colors.white,
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
                      //검색 버튼 클릭시 축제 목록 보여주기
                    },
                    child: Image.asset("assets/search.png", height:25, width:25,),
                    style: ElevatedButton.styleFrom(
                      primary:Colors.transparent,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                    )
                ),
              ],
            ),
          ),
          Container(
            child: Text("계절"),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "봄"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "여름"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "가을"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "겨울"),
              SizedBox(
                height: 1,
                width: 10,
              ),
            ],
          ),
          Divider(thickness: 0.5, indent: 20, endIndent: 20, color: Colors.black),
          Container(
            child: Text("지역"),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "서울"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "경기"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "대구"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "부산"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "울산"),
              SizedBox(
                height: 1,
                width: 10,
              ),
              CategoryButton(categoryName: "경북"),
              SizedBox(
                height: 1,
                width: 10,
              ),
            ],
          ),
          Divider(thickness: 0.5, indent: 20, endIndent: 20, color: Colors.black),
        ],
      ),
    );
  }
}
