import 'dart:async';
import 'package:festivalmap/page/Bookmark.dart';
import 'package:festivalmap/page/FestivalDetailPage.dart';
import 'package:festivalmap/page/HomePage.dart';
import 'package:festivalmap/page/MapPage.dart';
import 'package:festivalmap/page/Menu.dart';
import 'package:festivalmap/page/ReviewList.dart';
import 'package:festivalmap/page/MyPage.dart';
import 'package:festivalmap/page/viewmodel/HomePageViewController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:festivalmap/page/SearchList.dart';
import 'package:festivalmap/page/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NaverMapSdk.instance.initialize(
      clientId: '5cf0rejsbk',
      onAuthFailed: (error) {
        print('Auth failed: $error');
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FestivalMap",
      initialRoute: "/",
      initialBinding: BindingsBuilder(() {
      Get.put(HomePageViewController());
    }),
      theme: ThemeData(primarySwatch: Colors.pink,),
      getPages: [
        GetPage(name: '/',                   page: () => const FestivalMap()        ),
        GetPage(
          name: '/HomePage',
          page: () => const HomePage(),
        ),
        GetPage(name: '/MapPage',            page: () => const MapPage(),           ),
        GetPage(name: '/MyPage',             page: () => const MyPage(),            ),
        GetPage(name: '/Bookmark',           page: () => const Bookmark(),          ),
        GetPage(name: '/FestivalDetailPage', page: () => const FestivalDetailPage(),),
        GetPage(name: '/Menu',               page: () => const Menu(),              ),
        GetPage(name: '/ReviewList',         page: () => const ReviewList(),        ),
        GetPage(name: '/SearchList',         page: () => const SearchList(),        ),
        GetPage(name: '/EditProfile',         page: () => const EditProfile(),        ),
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
          () => MapPage(),
          transition: Transition.fadeIn,
          duration: Duration(seconds: 2),
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
