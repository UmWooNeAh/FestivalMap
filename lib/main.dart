import 'dart:async';
import 'package:festivalmap/page/Bookmark.dart';
import 'package:festivalmap/page/FestivalDetailPage.dart';
import 'package:festivalmap/page/HomePage.dart';
import 'package:festivalmap/page/MapPage.dart';
import 'package:festivalmap/page/Menu.dart';
import 'package:festivalmap/page/ReviewList.dart';
import 'package:festivalmap/page/mypage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FestivalMap",
      initialRoute: "/FestivalMap",
      theme: ThemeData(primarySwatch: Colors.grey,),
      getPages: [
        GetPage(name: '/',                   page: () => const FestivalMap()        ),
        GetPage(name: '/HomePage',           page: () => const HomePage(),          ),
        GetPage(name: '/MapPage',            page: () => const MapPage(),           ),
        GetPage(name: '/MyPage',             page: () => const MyPage(),            ),
        GetPage(name: '/Bookmark',           page: () => const Bookmark(),          ),
        GetPage(name: '/FestivalDetailPage', page: () => const FestivalDetailPage(),),
        GetPage(name: '/Menu',               page: () => const Menu(),              ),
        GetPage(name: '/ReviewList',         page: () => const ReviewList(),        ),
      ],
    );
  }
}

class FestivalMap extends StatefulWidget {
  const FestivalMap({Key? key}) : super(key: key);

  @override
  State<FestivalMap> createState() => _FestivalMapState();
}

class _FestivalMapState extends State<FestivalMap> {
  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 1), (){
        Get.offAll(
          () => HomePage(),
          transition: Transition.leftToRight,
          duration: Duration(seconds: 1),
        );
      }
    );

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Image.asset("assets/엄우넹.png"),
        alignment: Alignment.center,
      ),

    );
  }
}
