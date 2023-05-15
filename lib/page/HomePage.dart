import 'package:carousel_slider/carousel_slider.dart';
import 'package:festivalmap/class/FireService.dart';
import 'package:festivalmap/page/model/CustomNavigationBar.dart';
import 'package:festivalmap/page/model/HomePageCategoyButton.dart';
import 'package:festivalmap/page/model/HomePageFestivalObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> eventImages = ['assets/img.png', 'assets/img.png', 'assets/img.png',];
  final homePageFlowerButton = Image.asset("assets/HomePageFlowerButton.png", fit: BoxFit.fitWidth,);
  final homePageGuitarButton = Image.asset("assets/HomePageGuitarButton.png", fit: BoxFit.fitWidth,);

  int bannerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late List<String> festivalNames = [];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Festival Map", style: TextStyle(color: Colors.pinkAccent),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search_sharp, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),

      body: Stack(
        children: [
          ListView(
            children: [
              //Event Banner
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          onPageChanged: (index, reason){setState(() {bannerIndex = index + 1;});}),
                      items: eventImages.map((item) => Container(child: Image.asset(item, fit: BoxFit.fitHeight),),
                      ).toList(),
                    ),
                  ),

                  Container(
                    child: Text("<$bannerIndex/${eventImages.length}>", style: TextStyle(color: Colors.white),),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: Colors.grey,),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCategoryButton(buttonImage: homePageFlowerButton),
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: size.width * 0.5,
                    child: FilledButton(
                      onPressed: (){},
                      child: Text("내 주변에 무슨 축제가 있을까?", style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        side: BorderSide(color: Colors.pink, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),
                      ),
                    ),
                  ),
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),

                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("#요즘 핫한 페스티벌", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                  ),

                  HomePageFestivalObject(
                      festivalTitle: "2023 Daegu Hiphop Festival",
                      festivalDescription: "대한민국 최고의 힙합 페스티벌 '대구힙합페스티벌'이 돌아온다!"
                  ),
                  Container(height: 10,),
                  HomePageFestivalObject(
                      festivalTitle: "2023 Daegu Hiphop Festival",
                      festivalDescription: "대한민국 최고의 힙합 페스티벌 '대구힙합페스티벌'이 돌아온다!"
                  ),
                  Container(height: 10,),
                  HomePageFestivalObject(
                      festivalTitle: "2023 Daegu Hiphop Festival",
                      festivalDescription: "대한민국 최고의 힙합 페스티벌 '대구힙합페스티벌'이 돌아온다!"
                  ),
                  Container(height: 10,),
                  HomePageFestivalObject(
                      festivalTitle: "2023 Daegu Hiphop Festival",
                      festivalDescription: "대한민국 최고의 힙합 페스티벌 '대구힙합페스티벌'이 돌아온다!"
                  ),
                  Container(height: 120,),

                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}