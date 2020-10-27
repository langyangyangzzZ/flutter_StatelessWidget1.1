import 'package:flutter/material.dart';

class Flutter_Demo1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FlutterDemo1"),
        ),

        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "Column",
                  style: TextStyle(fontSize: 30),
                ),
                Icon(
                  Icons.android,
                  color: Colors.white,
                  size: 30,
                ),
                CloseButton(),
                BackButton(
                  color: Colors.amber,
                ),
                Chip(
                  label: Text("Chip使用"),
                  avatar: Icon(Icons.cake),
                ),
                Divider(
                  color: Colors.brown,
                  height: 50, //线的宽度
                  indent: 40, //距离左边40dp
                ),
                Card(
                  color: Colors.greenAccent,
                  elevation: 5, //设置阴影

                  margin: EdgeInsets.all(10), //设置上下左右外边距
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Card使用"),
                  ),
                ),
                AlertDialog(
                  title: Text("AlertDialog弹框"),
                  content: Text("AlertDialog弹框"),
                )
              ],
            )),
      ),
    );
  }
}

