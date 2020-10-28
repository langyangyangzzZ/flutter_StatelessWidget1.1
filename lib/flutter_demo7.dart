import 'package:flutter/material.dart';

//如何进行手势监听
class Flutter_Demo7 extends StatefulWidget {
  @override
  _Flutter_Demo7State createState() => _Flutter_Demo7State();
}

class _Flutter_Demo7State extends State<Flutter_Demo7> {
  double mX = 0;
  double mY = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  print("GestureDetector:点击了");
                },
                onDoubleTap: () {
                  print("GestureDetector:双击了");
                },
                onLongPress: () {
                  print("GestureDetector:长按了");
                },
                onTapUp: (TagUp) {
                  print("GestureDetector:单击抬起:${TagUp}");
                },

                onTapDown: (tapDown) {
                  print("GestureDetector:单击按下${tapDown}");
                },
                onTapCancel: () {
                  print("GestureDetector:取消了");
                },
                onPanUpdate: (e) {
                  setState(() {
                    mX += e.delta.dx;
                    mY += e.delta.dy;
                  });
                  print('onPanUpdate${e.delta.dx}\t\t${e.delta.dx}');
                },
                child: Icon(
                  Icons.android,
                  size: 100,
                ),
              )),
          Positioned(
            left: mX,
            top: mY,
            child: GestureDetector(
              onTap: () {
                print("GestureDetector长按抬起");
                setState(() {
                  mX = 0;
                  mY = 0;
                });
              },
              child: Icon(
                Icons.android,
                size: 32,
                color: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
