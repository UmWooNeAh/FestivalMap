import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class FestivalDetailPage extends StatefulWidget {
  const FestivalDetailPage({Key? key}) : super(key: key);

  @override
  State<FestivalDetailPage> createState() => _FestivalDetailPageState();
}

class _FestivalDetailPageState extends State<FestivalDetailPage> {

  final List<String> images = [
    'https://via.placeholder.com/500x200?text=Banner%201',
    'https://via.placeholder.com/500x200?text=Banner%202',
    'https://via.placeholder.com/500x200?text=Banner%203',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
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
        ],
      ),
    );
  }
}
