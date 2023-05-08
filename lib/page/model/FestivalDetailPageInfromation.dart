import 'package:festivalmap/page/model/FestivalReviewObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FestivalBasicInfo extends StatefulWidget {
  const FestivalBasicInfo({Key? key}) : super(key: key);

  @override
  State<FestivalBasicInfo> createState() => _FestivalBasicInfoState();
}

class _FestivalBasicInfoState extends State<FestivalBasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("홍보영상"),
          Icon(Icons.add),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/img.png", height: 100, width: 100,),
              Image.asset("assets/img.png", height: 100, width: 100,),
            ],
          ),
        ],
      ),
    );
  }
}


class FestivalProgram extends StatefulWidget {
  const FestivalProgram({Key? key}) : super(key: key);

  @override
  State<FestivalProgram> createState() => _FestivalProgramState();
}

class _FestivalProgramState extends State<FestivalProgram> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class FestivalEvent extends StatefulWidget {
  const FestivalEvent({Key? key}) : super(key: key);

  @override
  State<FestivalEvent> createState() => _FestivalEventState();
}

class _FestivalEventState extends State<FestivalEvent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FestivalReview extends StatefulWidget {
  const FestivalReview({Key? key}) : super(key: key);

  @override
  State<FestivalReview> createState() => _FestivalReviewState();
}

class _FestivalReviewState extends State<FestivalReview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(height: 10,),
        FestivalReviewObject(festivalTitle: "류지원님", festivalDescription: "우리아이가 너무좋아해요"),
        Container(height: 10,),
        FestivalReviewObject(festivalTitle: "류지원님", festivalDescription: "우리아이가 너무좋아해요"),
        Container(height: 10,),
        FestivalReviewObject(festivalTitle: "류지원님", festivalDescription: "우리아이가 너무좋아해요"),
        Container(height: 10,),
      ],
    );
  }
}

