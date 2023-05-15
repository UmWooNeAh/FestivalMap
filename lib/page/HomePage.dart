import 'package:carousel_slider/carousel_slider.dart';
import 'package:festivalmap/class/FireService.dart';
import 'package:festivalmap/page/model/HomePageCategoyButton.dart';
import 'package:festivalmap/page/model/HomePageFestivalObject.dart';
import 'package:festivalmap/page/viewmodel/HomePageViewController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../class/class.dart';
import 'model/CustomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // CategoryButton image setting
  final homePageFlowerButton = Image.asset("assets/HomePageFlowerButton.png", fit: BoxFit.fitWidth,);
  final homePageGuitarButton = Image.asset("assets/HomePageGuitarButton.png", fit: BoxFit.fitWidth,);

  // bannerindex initialization
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
          IconButton(icon: Icon(Icons.search_sharp, color: Colors.black,), onPressed: () {},),
        ],
      ),

      body: Stack(
        children: [
          ListView(
            children: [
              //Banner Object
              _bannerObject(),
              // Category button first row
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

              // Category Button second row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomePageCategoryButton(buttonImage: homePageGuitarButton),
                  // Random generated category button
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

              // start of festival object
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("#요즘 핫한 페스티벌", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
              ),

              FutureBuilder(
                future: FireService().readAllFests(),
                builder : (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.hasData == false){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  else{
                    // all festival data
                    List<Fest> fest = snapshot.data;
                    fest.sort((a,b) => a.fStars.compareTo(b.fStars));
                    fest.take(3).forEach((element) {festivalNames.add(element.fName);});

                    // festival object generation
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(3, (index) => HomePageFestivalObject(festivalName: festivalNames[index],))
                    );
                  }
                },
              ),
            ],
          ),
          Positioned(child: BottomNavBar(), bottom: 0, left: 0,),
        ]
      ),

    );
  }

  Widget _bannerObject() {
    return Obx(() => Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        // Dragable banner image
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    bannerIndex = index + 1;
                  });
                }),
            items: Get.find<HomePageViewController>().eventImages.value.map((item) =>
                Image.asset(item, fit: BoxFit.fitHeight),
            ).toList(),
          ),
        ),

        // Banner index box
        Container(
          child: Text("<$bannerIndex/${Get.find<HomePageViewController>().eventImages.length}>",
            style: TextStyle(color: Colors.white),),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: Colors.grey,),
        ),
      ],
    ));
  }

}