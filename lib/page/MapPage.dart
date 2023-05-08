import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> festivalSite = [];

  final List<LatLng> Data = [];
  late NaverMapController _naverMapController;


  addMarker(coordinate){
    int id = Random().nextInt(100);

    setState(() {
      festivalSite.add(Marker(position: coordinate, markerId: id.toString()));
    });
  }

  void initState(){
    super.initState();

    for (int i = 0; i < 10; i++){
      for (int j = 0; j < 10; j++){
        Data.add(LatLng(35.75 + i*0.01, 128.45 + j*0.01));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NaverMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(35.8, 128.5),
          zoom: 12,
        ),
        onMapCreated: (controller){
          setState(() {
            _naverMapController = controller;
            print(Data.length);
            for (int i = 0; i < Data.length; i++){
              addMarker(Data[i]);
            }
          });
        },
        markers: festivalSite,

        onMapTap: (coordinate){
          _naverMapController.moveCamera(CameraUpdate.scrollTo(coordinate));
          addMarker(coordinate);
        },
      ),
    );


  }
}