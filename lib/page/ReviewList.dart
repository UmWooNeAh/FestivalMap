import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  bool isWidgetVisible = true;

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
                    dispose();
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
    body: Column(
        children: [
         ReviewContainer(Fid: 1, Rid: 1, Uid: 1, RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
           Rname: "hello", content: "너무 재밌어요!", Rimage: Image(image: AssetImage("assets/DageuHipFe_Review.jpg"),
               width: 150, height: 150),),
          ReviewContainer(Fid: 2, Rid: 2, Uid: 1,  RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
            Rname: "hello", content: "너무 재밌어요!", Rimage: Image(image: AssetImage("assets/WhaleFe_Review.jpg"),
                width: 150, height: 150),),
        ],
    ),
  );
  }
}
