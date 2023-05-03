import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center, child: Text("카테고리"),),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(),
          ),
          
          Text("계절"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("봄"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10)
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Container(
                child: Text("여름"),
                padding: EdgeInsets.symmetric(horizontal: 10),
              )),
              ElevatedButton(onPressed: (){}, child: Container(
                child: Text("가을"),
                padding: EdgeInsets.symmetric(horizontal: 10),
              )),
              ElevatedButton(onPressed: (){}, child: Container(
                child: Text("겨울"),
                padding: EdgeInsets.symmetric(horizontal: 10),
              )),
            ],
          ),
          Divider(thickness: 1, indent: 20, endIndent: 20, color: Colors.black,),
          Text("지역"),
          Row(
            children: [

            ],
          ),
        ],
        
      ),
    );
  }
}
