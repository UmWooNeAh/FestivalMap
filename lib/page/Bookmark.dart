import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/CustomNavigationBar.dart';

List<BookmarkContainer> list = [
  BookmarkContainer(Fid: 1, Fname: "2023 대구 힙합 페스티벌",
      content: "---", Fimage: Image(image: AssetImage("assets/DaeguHipFe_Poster.png"))),
  BookmarkContainer(Fid: 2, Fname: "2023 울산 고래 축제",
      content: "---", Fimage: Image(image: AssetImage("assets/WhaleFe_Poster.jpg"))),
];

class BookmarkContainer extends StatefulWidget {
  final int Fid;
  final String Fname;
  final String content;
  final Image Fimage;

  const BookmarkContainer({Key? key, required this.Fid, required this.Fname, required this.content,
    required this.Fimage}) : super(key: key);

  @override
  State<BookmarkContainer> createState() => _BookmarkContainerState();
}

class _BookmarkContainerState extends State<BookmarkContainer> {

  void deleteContainer(int id) {
    setState(() {
      list.removeWhere((container) => container.Fid == id);
    });
  }

  bool isPressed = false;
  late int Fid;
  late String Fname;
  late String content;
  late Image Fimage;

  @override
  void initState() {
    Fid = widget.Fid;
    Fname = widget.Fname;
    content = widget.content;
    Fimage = widget.Fimage;
  }

  @override
  Widget build(BuildContext context) {
    Divider menuDivider = Divider(
      thickness: 1,
      color: Colors.grey,
    );
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                child: Fimage,
              ),
              SizedBox(width:20, height:0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 170,
                        child: Text(Fname, style: TextStyle(
                            fontWeight: FontWeight.bold ,fontSize: 15)),
                      ),
                      IconButton(
                          icon: isPressed ? Image.asset("assets/005-bookmark.png", width: 25,height: 25 )
                              :Image.asset("assets/selectedBookmark.png", width: 25,height: 25 ),
                          onPressed: () {
                            {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('북마크 해제'),
                                    content: Text('북마크를 해제하시겠습니까?'),
                                    actions: [
                                      TextButton(
                                        child: Text('취소'),
                                        onPressed: () {
                                          Navigator.of(context).pop(); // 다이얼로그 닫기
                                        },
                                      ),
                                      TextButton(
                                        child: Text('삭제'),
                                        onPressed: () {
                                          isPressed = !isPressed;
                                          deleteContainer(Fid);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('해당 축제가 찜 목록에서 삭제되었습니다.')));
                                          Navigator.of(context).pop();// 다이얼로그 닫기
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            };
                          }
                      ),
                    ],
                  ),
                  menuDivider,
                  Text(content, style: TextStyle(
                      fontSize: 13)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {

  Future<void> _refreshItems() async {
    // 새로고침 작업 수행
    await Future.delayed(Duration(seconds: 2));
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        title: Text("북마크", style: TextStyle(
            fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
      ),
      body:  list.isEmpty ?
      Stack(
        children: [
          Center(
            child: Text(
              '현재 찜한 축제가 없어요.',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(child: BottomNavBar(), bottom: 0, left: 0,),
        ],
      )
      : RefreshIndicator(
          onRefresh: _refreshItems,
          child: Stack(
            children: [
              ListView.builder(
                  itemCount: list.length, itemBuilder: (context, index) {
                    return Column(children: [list[index]],);
                  }
              ),
              Positioned(child: BottomNavBar(), bottom: 0, left: 0,),
            ],
          ),
        ),
    );
  }
}
