import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<ReviewContainer> list = [
  ReviewContainer(Fid: 100, Rid: 1, Uid: 1, RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
    Rname: "hello", content: "너무 재밌어요!", Rimage: Image(image: AssetImage("assets/DageuHipFe_Review.jpg"),
        width: 150, height: 150),),
  ReviewContainer(Fid: 101, Rid: 2, Uid: 1,  RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
    Rname: "hello", content: "너무 재밌어요!", Rimage: Image(image: AssetImage("assets/WhaleFe_Review.jpg"),
        width: 150, height: 150),)
];

class ReviewContainer extends StatefulWidget {
  final int Fid;
  final int Rid;
  final int Uid;
  final String RDate;
  final String Fname;
  final String Rname;
  final String content;
  final Image Rimage;

  const ReviewContainer({Key? key, required this.Fid, required this.Rid
    , required this.Uid, required this.RDate, required this.Fname, required this.Rname, required this.content,
    required this.Rimage}) : super(key: key);

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {

  void deleteContainer(int id) {
    setState(() {
      list.removeWhere((container) => container.Rid == id);
    });
  }

  late int Fid;
  late int Rid;
  late int Uid;
  late String RDate;
  late String Fname;
  late String Rname;
  late String content;
  late Image Rimage;

  @override
  void initState() {
    Fid = widget.Fid;
    Rid = widget.Rid;
    Uid = widget.Uid;
    RDate = widget.RDate;
    Fname = widget.Fname;
    Rname = widget.Rname;
    content = widget.content;
    Rimage = widget.Rimage;
  }

  @override
  Widget build(BuildContext context) {
    Divider menuDivider = Divider(
      thickness: 1,
      color: Colors.grey,
    );

      return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(RDate+"에 리뷰를 남겼어요.", style: TextStyle(
                  fontSize: 17)),
              IconButton(
                icon: Image.asset('assets/001-bin.png', width: 25, height: 25),
                onPressed: () {
                  deleteContainer(Rid);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('해당 리뷰가 삭제되었습니다.')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
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
              Rimage,
              SizedBox(width: 15, height: 0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Fname, style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
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


class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {},
        ),
        title: Text("리뷰목록", style: TextStyle(
        fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
        ),
        body: list.isEmpty ? Center(
          child: Text(
            '현재 쓴 리뷰가 없어요.\n  리뷰를 남겨주세요!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        )
        : RefreshIndicator(
        onRefresh: _refreshItems,
        child: ListView.builder(
          itemCount: list.length, itemBuilder: (context, index) {
              return Column(
                children: [
                  list[index]
                  ]
                );
        }
      ),
      ),
    );
    }
}
