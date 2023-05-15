import 'package:festivalmap/page/MyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:festivalmap/page/Bookmark.dart';

Image getImage = Image.asset("assets/DaeguHipFe_Review.jpg");

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final myController = TextEditingController();
  final Color firstColor = Colors.black;
  final Color secondColor = Colors.grey;
  final Color thirdColor = Colors.white;
  String tempusername = "";
  late Image tempImage;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        elevation: 20,
        backgroundColor: thirdColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Get.toNamed("MyPage");
          },
        ),
        title: Text("프로필 편집", style: TextStyle(
        fontSize: 20, color: Colors.black)
        ),
        centerTitle: true,
        actions: <Widget>[
        IconButton(
        icon: Icon(Icons.save, color: Colors.black,),
        onPressed: () {
          if(!tempusername.isEmpty && tempusername != UserName) {
            UserName = "";
            UserName = tempusername;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('프로필이 수정되었습니다.')),
            );
          }
          else
          {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('업데이트된 정보가 없습니다.')),
              );
          }
        },
        ),
        ],
        ),
        body:
         Center(
           child: Column(
             children: [
               SizedBox(width:0, height:20),
               Text("닉네임 수정", style: TextStyle(
                   fontSize: 20, color: Colors.black, )
               ),
               Container(
                 margin: EdgeInsets.all(15),
                 padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                 decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.pinkAccent,
                       width: 2.0,
                     ),
                     borderRadius: BorderRadius.circular(15.0)
                 ),
                 child: TextField(
                   controller: myController,
                   inputFormatters: [
                     FilteringTextInputFormatter.deny(RegExp("\\s")) // 공백 제거
                   ],
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: InputBorder.none,
                    ),
                     onChanged: (value) {
                       setState(() {
                         tempusername = value;// 입력된 텍스트를 저장
                       });
                   },
                 ),
               ),
             ],
           ),
         ),
    );
  }
}
