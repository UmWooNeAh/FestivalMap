import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<ReviewContainer> list = [
  ReviewContainer(Fid: 100, Rid: 1, Uid: 1, RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
    Rname: "hello", Rimage: Image(image: AssetImage("assets/DaeguHipFe_Poster.png"),
        width: 150, height: 150),),
  ReviewContainer(Fid: 101, Rid: 2, Uid: 1,  RDate: "2023.04.27", Fname: "2023 대구 힙합 페스티벌",
    Rname: "hello", Rimage: Image(image: AssetImage("assets/WhaleFe_Poster.jpg"),
        width: 150, height: 150),)
];

class ReviewContainer extends StatefulWidget {
  final int Fid;
  final int Rid;
  final int Uid;
  final String RDate;
  final String Fname;
  final String Rname;
  final Image Rimage;

  const ReviewContainer({Key? key, required this.Fid, required this.Rid
    , required this.Uid, required this.RDate, required this.Fname, required this.Rname,
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
  late Image Rimage;

  @override
  void initState() {
    Fid = widget.Fid;
    Rid = widget.Rid;
    Uid = widget.Uid;
    RDate = widget.RDate;
    Fname = widget.Fname;
    Rname = widget.Rname;
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
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("검색결과", style: TextStyle(
        fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: list.length, itemBuilder: (context, index) {
          return Column(
              children: [
                list[index]
              ]
          );
        }
        ),
    );
  }
}
