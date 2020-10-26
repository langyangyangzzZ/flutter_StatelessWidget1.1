import 'package:flutter/material.dart';
import 'package:flutterapp/flutter_demo1.dart';
import 'package:flutterapp/flutter_demo2.dart';
import 'package:flutterapp/flutter_demo3.dart';
import 'package:flutterapp/flutter_demo4.dart';


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
      routes: <String, WidgetBuilder>{
        "flutter_demo1": (BuildContext content) => Flutter_Demo1(),
        "flutter_demo2": (BuildContext content) => Flutter_Demo2(),
        "flutter_demo3": (BuildContext content) => Flutter_Demo3(),
        "flutter_demo4": (BuildContext content) => Flutter_Demo4(),
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
            value: isByName,
            onChanged: (value) {
              setState(() {
                print(("SZJsetState"));
                isByName = value;
              });
            },
          ),
          ButtonItem("Flutter_Demo1", Flutter_Demo1(), "flutter_demo1"),
          ButtonItem("Flutter_Demo2", Flutter_Demo2(), "flutter_demo2"),
          ButtonItem("Flutter_Demo3", Flutter_Demo3(), "flutter_demo3"),
          ButtonItem("Flutter_Demo4", Flutter_Demo4(), "flutter_demo4"),

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