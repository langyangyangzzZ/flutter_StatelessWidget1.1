import 'package:flutter/material.dart';
import 'package:flutterapp/flutter_demo1.dart';
import 'package:flutterapp/flutter_demo2.dart';
import 'package:flutterapp/flutter_demo3.dart';
import 'package:flutterapp/flutter_demo4.dart';
import 'package:flutterapp/flutter_demo5.dart';
import 'package:flutterapp/flutter_demo6.dart';
import 'package:flutterapp/flutter_demo7.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print(("SZJStatelessWidget"));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
        body: MainHomePage(),
      ),
      routes: <String, WidgetBuilder>{//声明路由
        "flutter_demo1": (BuildContext content) => Flutter_Demo1(),
        "flutter_demo2": (BuildContext content) => Flutter_Demo2(),
        "flutter_demo3": (BuildContext content) => Flutter_Demo3(),
        "flutter_demo4": (BuildContext content) => Flutter_Demo4(),
        "flutter_demo5": (BuildContext content) => Flutter_Demo5(),
        "flutter_demo7": (BuildContext content) => Flutter_Demo7(),
        "flutter_demo6": (BuildContext content) {
           return Flutter_Demo6();
        },
      },
    );
  }
}

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool isByName = false;

  Widget build(BuildContext context) {
    print(("SZJStatefulWidget"));
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
        SwitchListTile(
            title: Text('${isByName?'':'不'}是否开启路由'),
            value: isByName,//是否选中
            subtitle: Text("副标题"),//副标题
            dense: true,//是否垂直密集居中 默认false
          activeColor: Colors.black,//选中时滑动小球颜色
          activeTrackColor: Colors.yellow,//选中时滑道颜色
          inactiveThumbColor: Colors.red,//未选中时滑动小球颜色
          inactiveTrackColor: Colors.deepPurple,//未选中时滑道颜色

          secondary: Icon(Icons.android),//左边图片
          selected: true,//副标题 左边图片跟随activeColor颜色变化
            onChanged: (value) {//响应事件
              setState(() {
                print(("SZJsetState"));
                isByName = value;
              });
            },
          ),
          ButtonItem("Flutter_Demo1", Flutter_Demo1(), "flutter_demo1"),
          ButtonItem("Flutter_Demo2", Flutter_Demo2(), "flutter_demo2"),
          ButtonItem("Flutter_Demo3", Flutter_Demo3(), "flutter_demo3"),
          ButtonItem("StatelessWidget与基础组件", Flutter_Demo4(), "flutter_demo4"),
          ButtonItem("StatefluWidget与基础组件", Flutter_Demo5(), "flutter_demo5"),
          ButtonItem("如何进行Flutter布局开发", Flutter_Demo6(), "flutter_demo6"),
          ButtonItem("如何进行Flutter手势点击事件监听", Flutter_Demo7(), "flutter_demo7"),

        ],
      ),
    );
  }

  ButtonItem(String s, Widget widget, String title) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (isByName) {
            Navigator.pushNamed(context, title);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget));
          }
        },
        child: Text(s),
      ),
    );
  }
}
