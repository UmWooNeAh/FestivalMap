import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // primary color declaration
  final Color firstColor = Colors.black;
  final Color secondColor = Colors.grey;
  final Color thirdColor = Colors.white;
  List<String> eventImage = <String>["a", "b", "c"];

  final List<String> images = [
    'https://via.placeholder.com/500x200?text=Banner%201',
    'https://via.placeholder.com/500x200?text=Banner%202',
    'https://via.placeholder.com/500x200?text=Banner%203',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: thirdColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: firstColor,),
          onPressed: () {},
        ),
        title: Text("My Page", style: TextStyle(color: firstColor,),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(),
              items: images.map(
                  (item) => Container(
                    child: Image.network(item, fit: BoxFit.cover, width: 500),
                  )
              ).toList(),
            ),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    )
                ),
              ),
              HomePageCategoricalButton(buttonIcon: Icon(Icons.add)),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "map"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        ],
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
