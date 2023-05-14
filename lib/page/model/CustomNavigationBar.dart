import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container (
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                    isComplex: false,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: -30,
                          left: size.width/2 - 50,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: FittedBox(
                              child: FloatingActionButton(
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment(0.0, -0.5),
                                      end: Alignment.bottomCenter,
                                      colors: [ Color(0xffff498b), Color(0xfffff174) ]
                                    ),
                                  ),
                                ),
                                onPressed: (){},
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width * 0.19,
                              height: 46,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/004-category-1.png', width: 30, height: 30,),
                                  Text("카테고리",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Color(0xff888888)),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                            ),
                            Container(
                              child: Opacity(
                                opacity: 0,
                                child: Container(
                                width: size.width * 0.19, height: 60, margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0x00000000),),
                                    onPressed: (){},
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              width: size.width * 0.19,
                              height: 46,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/003-maps-and-flags-1.png', width: 30, height: 30,),
                                  Text("지도",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Color(0xff888888)),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                            ),
                            Container(
                              child: Opacity(
                                opacity: 0,
                                child: Container(
                                  width: size.width * 0.19, height: 60, margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0x00000000),),
                                    onPressed: (){},
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(width: size.width * 0.24,),
                        Stack(
                          children: [
                            Container(
                              width: size.width * 0.19,
                              height: 46,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/unselectedBookmark.png', width: 30, height: 30,),
                                  Text("북마크",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Color(0xff888888)),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                            ),
                            Container(
                              child: Opacity(
                                opacity: 0,
                                child: Container(
                                  width: size.width * 0.19, height: 60, margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0x00000000),),
                                    onPressed: (){},
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              width: size.width * 0.19,
                              height: 46,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/001-smile.png', width: 30, height: 30,),
                                  Text("마이페이지",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Color(0xff888888)),
                                  )
                                ],
                              ),
                              margin: EdgeInsets.fromLTRB(0, 26, 0, 0),
                            ),
                            Container(
                              child: Opacity(
                                opacity: 0,
                                child: Container(
                                  width: size.width * 0.19, height: 60, margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0x00000000),),
                                    onPressed: (){},
                                    child: Container(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 18.4)
      ..lineTo(size.width * 0.5 - 43.9, 18.4)
      ..quadraticBezierTo(size.width * 0.5, -18.4, size.width * 0.5 + 43.9, 18.4)
      ..lineTo(size.width, 18.4)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawShadow(path.shift(Offset(0, -3)), Colors.black, 5.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}