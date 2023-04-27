import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // primary color declaration
    final Color firstColor  = Colors.black;
    final Color secondColor = Colors.grey;
    final Color thirdColor  = Colors.white;
    final ButtonStyle myPageMenuButton = ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        )
    ); // myPageMenuButton style declaration
    final ButtonStyle myPageMenuButton_2 = ElevatedButton.styleFrom(
      backgroundColor: secondColor,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
      )
    ); // myPageMenuButton_2 style declaration

    Divider menuDivider = Divider(
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: firstColor,
    );
    final List<String> entries   = <String>["Notice", "Event", "Support", "Terms"];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  Text("조우석 님",),
                  Text("Platinum Level", style: TextStyle(color: Colors.pink,),),
                ],
              ),
            ],
          ),
          menuDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: Icon(Icons.chat_bubble, color: secondColor,),
                onPressed: (){},
                style: myPageMenuButton,
              ),
              ElevatedButton(
                child: Icon(Icons.card_membership, color: secondColor,),
                onPressed: (){},
                style: myPageMenuButton,
              ),
              ElevatedButton(
                child: Icon(Icons.cake, color: secondColor,),
                onPressed: (){},
                style: myPageMenuButton,
              ),
              ElevatedButton(
                child: Icon(Icons.list, color: secondColor,),
                onPressed: (){},
                style: myPageMenuButton,
              ),
            ],
          ),
          Divider(thickness: 0, height: 20, color: thirdColor,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text("쿠폰함", style: TextStyle(color: Colors.black,),),
                onPressed: (){},
                style: myPageMenuButton_2,
              ),
              TextButton(
                child: Text("멤버쉽", style: TextStyle(color: Colors.black),),
                onPressed: (){},
                style: myPageMenuButton_2,
              ),
            ],
          ),

          ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(entries[index], style: TextStyle(fontSize: 15),),
                      ),
                      ElevatedButton(
                          onPressed: (){},
                          child: Icon(Icons.arrow_back_ios, color: secondColor,)),
                    ],
                  ),
                  menuDivider,
                ],
              );

            },
          ),

        ]
      ),
    );
  }
}
