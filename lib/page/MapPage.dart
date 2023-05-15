import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import 'model/FestivalMarker.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  /*List<Marker> festivalSite = [];
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
  }*/

  List<NMarker> markers = [];
  List<NInfoWindow> infos = [];
  late NaverMapController mapController;

  @override
  void initState(){
    super.initState();

    for(int i = 0; i < 10; i++){
      NLatLng newlocation = NLatLng(35.85 + Random().nextDouble()*0.1, 128.55 + Random().nextDouble()*0.1);
      markers.add(NMarker(id: '${i}', position: newlocation));
      infos.add(NInfoWindow.onMarker(id: '${i}', text: "id number ${i}"));
      infos.add(NInfoWindow.onMap(id: '${i}', text: "id number ${i}", position: newlocation));
      markers[i].setOnTapListener((marker) => returnMarkerTap(marker));
    }
  }

  String selected = "1";
  void returnMarkerTap(NMarker marker){
    setState(() {
      selected  = marker.info.id;
    });
  }


  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            options: const NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                  target: NLatLng(35.9, 128.6),
                  zoom: 12,
              ),
            ),
            onMapReady: (controller){
              mapController = controller;
              mapController.addOverlayAll(markers.toSet());
              mapController.addOverlayAll(infos.toSet());
            },
            onSymbolTapped: (NSymbolInfo symbol){
              print("symbol click");
            },
            onMapTapped: (NPoint point, NLatLng latLng){
              print("map click");
            },
          ),

          Positioned(
            left: size.width*0.1,
            right: size.width*0.1,
            top: size.height*0.08,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search_sharp),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: size.width*0.1,
            bottom: 20,
            child: Container(
              width: size.width * 0.8,
              height: 100,
              color: Colors.white,
              child: FestivalMarker(fName: selected,),
            ),
          ),
        ],

      ),
    );
  }
  /*Widget build(BuildContext context) {
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
  }*/
}