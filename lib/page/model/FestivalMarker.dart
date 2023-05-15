import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FestivalMarker extends StatefulWidget {
  const FestivalMarker({Key? key, required this.fName}) : super(key: key);
  final String fName;

  @override
  State<FestivalMarker> createState() => _FestivalMarkerState();
}

class _FestivalMarkerState extends State<FestivalMarker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 170,
          width: 150,
          child: Image.asset("assets/img.png"),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Text(widget.fName),
                Divider(),
                Text("asdfasdfasdfasdfasdf"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
