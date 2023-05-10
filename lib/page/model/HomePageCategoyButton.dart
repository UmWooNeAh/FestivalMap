import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePageCategoryButton extends StatefulWidget {
  const HomePageCategoryButton({Key? key, required this.buttonImage}) : super(key: key);
  final Image buttonImage;

  @override
  State<HomePageCategoryButton> createState() => _HomePageCategoryButtonState();
}

class _HomePageCategoryButtonState extends State<HomePageCategoryButton> {
  late Image buttonImage;
  @override
  void initState(){
    super.initState();

    buttonImage = widget.buttonImage;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 40, height: 40, child: buttonImage, margin: EdgeInsets.fromLTRB(20, 20, 20, 0),),
        Container(
          width: 40, height: 40, margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: FilledButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent,),
            onPressed: (){setState(() {Get.toNamed("ReviewList");});},
            child: Container(),
          ),
        ),
      ],
    );
  }
}
