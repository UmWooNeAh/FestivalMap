import 'package:carousel_slider/carousel_slider.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool circleButtonToggle = false;
  int index = 2;

  // primary color declaration
  final Color firstColor = Colors.pinkAccent;
  final Color secondColor = Colors.grey;
  final Color thirdColor = Colors.white;
  List<String> eventImage = <String>["a", "b", "c"];

  final List<String> images = [
    'assets/img.png',
    'assets/img.png',
    'assets/img.png',
  ];
  int value = 1;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: thirdColor,
        title: Text("축제지도", style: TextStyle(color: firstColor,),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search_sharp, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      onPageChanged: (index, reason){
                        setState(() {
                          value = index + 1;
                        });
                      }),
                  items: images.map(
                          (item) => Container(
                        child: Image.asset(item, fit: BoxFit.fitHeight),
                      )
                  ).toList(),
                ),
              ),

              Container(
                child: Text("<$value/12>", style: TextStyle(color: Colors.white),),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
              ElevatedButton(
                onPressed: (){},
                child: Text("내 주변에 무슨 축제가 있을까?"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
              ),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:Text("#요즘 핫한 페스티벌", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/img_1.png", fit: BoxFit.fitHeight,),
                  ),


                  Expanded(
                    child : Padding(
                      padding: EdgeInsets.fromLTRB(0,0,20,0),
                      child:Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text("2023 Daegu Hiphop Festival"),
                            Text("asdf"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(),
            ],
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        barColor: Colors.white,
        controller: FloatingBottomBarController(initialIndex: 1),

        bottomBar: [
          BottomBarItem(
            icon: const Icon(Icons.category_outlined, size: 30),
            iconSelected: const Icon(Icons.category_outlined,
                color: Colors.red,
                size: 30),
            title: "카테고리",
            dotColor: Colors.red,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon:
            const Icon(Icons.pin_drop_outlined, size: 30),
            iconSelected: const Icon(Icons.pin_drop_outlined,
                color: Colors.red,
                size: 30),
            title: "지도",
            dotColor: Colors.red,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon: const Icon(Icons.bookmark_border, size: 30),
            iconSelected: const Icon(Icons.bookmark_border,
                color: Colors.red,
                size: 30),
            title: "북마크",
            dotColor: Colors.red,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
          BottomBarItem(
            icon:
            const Icon(Icons.tag_faces, size: 30),
            iconSelected: const Icon(Icons.tag_faces,
                color: Colors.red,
                size: 30),
            title: "마이페이지",
            dotColor: Colors.red,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.red,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.home,
                color: AppColors.white,
              ),
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.access_alarm,
                color: AppColors.white,
              ),
            ),
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.ac_unit_outlined,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCategoricalButton extends StatelessWidget {
  final Icon buttonIcon;
  const HomePageCategoricalButton({Key? key, required this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){},
        child: buttonIcon,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}