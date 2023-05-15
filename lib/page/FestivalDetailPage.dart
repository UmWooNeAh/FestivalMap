import 'package:carousel_slider/carousel_slider.dart';
import 'package:festivalmap/class/FireService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'model/FestivalDetailPageInfromation.dart';

class FestivalDetailPage extends StatefulWidget {
  const FestivalDetailPage({Key? key,}) : super(key: key);

  @override
  State<FestivalDetailPage> createState() => _FestivalDetailPageState();
}

class _FestivalDetailPageState extends State<FestivalDetailPage> with TickerProviderStateMixin {
  final List<String> images = ["assets/꽃축제 사진.jpg", "assets/꽃축제 사진.jpg", "assets/꽃축제 사진.jpg",];
  int bannerIndex = 1;
  late int Bookmark = 1;
  Image Star               = Image.asset("assets/selectedStar.png",       height: 20, fit: BoxFit.fitHeight,);
  Image selectedBookmark   = Image.asset("assets/selectedBookmark.png",   height: 20, fit: BoxFit.fitHeight,);
  Image unselectedBookmark = Image.asset("assets/unselectedBookmark.png", height: 20, fit: BoxFit.fitHeight,);
  late String fName;
  late Image BookmarkState;
  late TabController _tabController;

  @override
  void initState(){
    super.initState();

    fName = Get.arguments;
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    BookmarkState  = unselectedBookmark;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: FireService().readFestByName(fName),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData == false){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
            ),
            body: Column(
              children: [
                //festival object image banner
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                            viewportFraction: 1,
                            onPageChanged: (index, reason){setState(() {bannerIndex = index + 1;});}),
                        items: images.map((item) => Container(child: Image.asset(item, fit: BoxFit.fitHeight),),
                        ).toList(),
                      ),
                    ),

                    Container(
                      child: Text("<$bannerIndex/${images.length}>", style: TextStyle(color: Colors.white),),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.grey,),
                    ),
                  ],
                ),

                //festival name, star, bookmark, move to map
                Container(
                  width: size.width,
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Text(
                          fName,
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Star,
                                  Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text("${snapshot.data.fStars}"),),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        Bookmark *= -1;
                                        BookmarkState = Bookmark == 1 ? unselectedBookmark : selectedBookmark;
                                      });
                                    },
                                    child: BookmarkState,
                                  ),
                                  Padding(padding: EdgeInsets.fromLTRB(5,0,10,0), child: Text("1234"),),
                                ],
                              ),
                            ),

                            ElevatedButton(
                              onPressed: (){
                                Get.toNamed("MapPage");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Text(
                                "지도보기",
                                style: TextStyle(
                                  color: Colors.pink,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("기본정보", style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("프로그램", style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("이벤트", style: TextStyle(color: Colors.black),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text("리뷰", style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FestivalBasicInfo(),
                      FestivalProgram(),
                      FestivalEvent(),
                      FestivalReview(),
                    ],
                  ),
                ),


              ],
            ),
          );
        }
      },
    );
  }
}
