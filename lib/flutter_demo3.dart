import 'package:flutter/material.dart';

class Flutter_Demo3 extends StatefulWidget {
  @override
  _Flutter_Demo3State createState() => _Flutter_Demo3State();
}

class _Flutter_Demo3State extends State<Flutter_Demo3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "page1",
                  ),
                  Tab(
                    text: "page2",
                  ),
                  Tab(
                    text: "page3",
                  )
                ],
              ),
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(RedColor().initRed()),
            ),
      ),
    ));
  }
}

//颜色
class Color implements YellowColor {
  void initColor() {
    print("我是颜色");
  }

  @override
  void initYellow() {
    // TODO: implement initYellow
    print("我是Color中的黄色");
  }
}

class RedColor extends YellowColor {
  String initRed() {
    print("我是红色");
    initYellow();
    return '我是红色\n' + '我是黄色';
  }
}

class YellowColor {
  void initYellow() {
    print("我是黄色");
  }
}

class Black {
  void initBlack() {
    print("我是黑色");
  }
}
