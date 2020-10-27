import 'package:flutter/material.dart';
//StatelessWidget与基础组件
class Flutter_Demo4 extends StatelessWidget {
  int mChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.bottomLeft,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        //设置子Widget居中
                        padding: EdgeInsets.all(50),
                        //设置四周内边距为50
                        margin: EdgeInsets.all(50),
                        //设置四周外边距为50
                        decoration: BoxDecoration(
                          //设置装饰器 改变Container容器颜色和50度圆角
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Text(
                          //设置文字 和颜色大小以及字体
                          "Container122333444455555", //设置date显示数据
                          style: TextStyle(
                            fontSize: 20,
                            //字体大小
                            color: Colors.blue,
                            //字体颜色
                            decoration: TextDecoration.lineThrough,
                            //波浪线
                            decorationColor: Colors.red,
                            //波浪线的颜色
                            decorationStyle: TextDecorationStyle.wavy,
                            //绘制波浪线
                            fontWeight: FontWeight.bold,
                            //字体加粗
                            fontStyle: FontStyle.italic,
                            //字体倾斜
                            letterSpacing: 4, //字体之间相隔4dp
                          ),
                          maxLines: 1, //最大显示1行
                          overflow: TextOverflow.ellipsis, //将溢出部分以...方式显示
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      Icon(
                        Icons.arrow_back, //图片
                        size: 80, //因为是正方形图片,设置的宽和高
                        color: Colors.red, //设置颜色
                        textDirection: TextDirection.rtl, //文本从右到左
                      ),
                      CloseButton(),
                      BackButton(
                        color: Colors.blue,
                      ),
                      Chip(
//              avatar: Icon(Icons.ac_unit),//设置左边图标
                        avatar: CircleAvatar(
                          //设置左边图标
                          child: Text("C"),
                          backgroundColor: Colors.red,
                          radius: 30, //设置圆的大小
                        ),
                        label: Text("Chip"),
                        //设置显示文字
                        labelStyle: TextStyle(fontSize: 30),
                        //设置文字样式
                        labelPadding: EdgeInsets.all(10),
                        //设置文字内边距
                        deleteIcon: Icon(
                          Icons.delete,
                          size: 50,
                        ),
                        //设置右边点击按钮
                        deleteButtonTooltipMessage: "长按弹出",
                        onDeleted: () {
                          //设置Chip点击事件
                          print('当前下标为${mChipIndex++}');
                        },
                        //设置点击事件长按弹出框
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        //设置Chip圆角
                        elevation: 20,
                        //设置阴影

                        backgroundColor: Colors.greenAccent,
                        //设置Chip背景颜色
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 30),
                        child: Divider(
                          color: Colors.pink,
                          //设置颜色
                          height: 60,
                          //设置高度
                          thickness: 10,
                          //设置分割线宽度
                          indent: 20,
                          //设置距离左边20dp
                          endIndent: 100, //设置距离右边100dp
                        ),
                      ),
                      Card(
                        color: Colors.pink, //Card背景色
                        elevation: 10, //阴影
                        child: Container(
                          width: 200, //宽
                          height: 100, //高
                          child: Text(
                            "卡片布局",
                            textAlign: TextAlign.center, //文字居中
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            //圆角
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(20))),
                      ),
                      new AlertDialog(
                        title: Text("AlertDialog弹框"),
                        //标题
                        content: Text("这里是弹框内容"),
                        //文本内容
                        actions: <Widget>[
                          //子Widget
                          Container(
                            child: Text("确定"),
                          ),
                          Container(
                            child: Text("取消"),
                          ),
                        ],
                        backgroundColor: Colors.green,
                        //背景颜色
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        //圆角
                        elevation: 20,
                        //阴影
                        contentPadding: EdgeInsets.all(20),
                        //文本内容内边距
                        contentTextStyle: TextStyle(
                            fontSize: 20, color: Colors.white), //文本内容样式
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
