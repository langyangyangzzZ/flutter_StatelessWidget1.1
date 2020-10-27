import 'package:flutter/material.dart';

//如何进行Flutter布局开发
class Flutter_Demo6 extends StatefulWidget {
  @override
  _Flutter_Demo6State createState() => _Flutter_Demo6State();
}

class _Flutter_Demo6State extends State<Flutter_Demo6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       body:Container(
           color: Colors.blue,
           child: ListView(
             children: <Widget>[
               Column(

                 children: <Widget>[
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisSize: MainAxisSize.max,
                     textDirection: TextDirection.rtl,
                     verticalDirection: VerticalDirection.up,
                     children: <Widget>[
                       Opacity(
                         opacity: 0.8,
                         alwaysIncludeSemantics: false,
                         child: Image.network(
                           "http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",
                           width: 100,
                           height: 150,
                         ),
                       ),
                       ClipOval(
//            clipBehavior: Clip.none,//不设置圆角
                         child: Image.network(
                           "http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",
                           width: 100,
                           height: 150,
                         ),
                       ),
                       ClipRRect(
                         borderRadius: BorderRadius.all(Radius.circular(20)),
                         child: Image.network(
                           "http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",
                           width: 100,
                           height: 150,
                         ),
                       ),
                     ],
                   ),
                   Container(
                       height: 200,
                       margin: EdgeInsets.all(30),
                       alignment: Alignment.center,
                       child: PhysicalModel(
                         borderRadius: BorderRadius.circular(20),
                         clipBehavior: Clip.antiAlias,
                         //设置抗锯齿 这个必须加!!
                         shape: BoxShape.circle,
                         //设置圆角
                         elevation: 20,
                         color: Colors.transparent,
                         shadowColor: Colors.greenAccent,
                         //阴影颜色
                         child: PageView(
                           children: <Widget>[
                             initPageViewItem("Page1", Colors.white),
                             initPageViewItem("Page2", Colors.yellow),
                             initPageViewItem("Page3", Colors.red),
                           ],
                         ),
                       )),
                   Center(
                     child: Text("居中了??"),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 60),
                     child: Text("我已经向左移动了"),
                   ),
                   SizedBox(
                     width: 100,
                     height: 100,
                     child: Container(
                       padding: EdgeInsets.only(top: 30),
                       color: Colors.green,
                     ),
                   ),
                   FractionallySizedBox(
                     widthFactor: 0.9,
                     child: Container(
                       padding: EdgeInsets.only(top: 30),
                       alignment: Alignment.center,
                       color: Colors.yellow,
                       child: Text("FractionallySizedBox",style: TextStyle(fontSize: 10),),
                     ),
                   ),
                   Stack(
                     fit: StackFit.passthrough,//我没看出效果
                     overflow: Overflow.clip,//我没看出效果
                     textDirection: TextDirection.ltr,//我没看出效果
                     alignment: Alignment.topRight,//我没看出效果
                     children: <Widget>[
                       Image.network("http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",width: 100,height: 150,),
                       Positioned(
                         left: 0,
                         top: 0,
                         child: Image.network("http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",width: 20,height: 30,),
                       )
                     ],
                   ),

                   Container(
                     child: Wrap(
                       direction: Axis.horizontal,//排列方式
                       alignment: WrapAlignment.end,//对齐方式
                       spacing: 5, //间距
                       runSpacing: 20, //上下间距
                       runAlignment: WrapAlignment.spaceBetween,
                       textDirection: TextDirection.rtl,
                       verticalDirection: VerticalDirection.down,
                       children: <Widget>[
                         initChipItem("Flutter"),
                         initChipItem("Java"),
                         initChipItem("C++"),
                         initChipItem("Java"),
                         initChipItem("Flutter"),
                         initChipItem("C#"),
                         initChipItem("PHP"),
                         initChipItem("HTML"),
                         initChipItem("Flutter"),
                         initChipItem("Java"),
                         initChipItem("Pathon"),
                         initChipItem("Flutter"),
                         initChipItem("switch"),
                       ],
                     ),
                   )
                 ],

               )
             ],
           )
       ),
     ),
    );
  }
}

initChipItem(String lable) {
  return Chip(
    label: Text(lable),
    avatar: CircleAvatar(
      backgroundColor: Colors.black87,
      child: Text(lable.substring(0, 1)),
    ), //圆形头像
  );
}

initPageViewItem(String s, Color color) {
  return Container(
    color: color,
    alignment: Alignment.center,
    child: Text(
      s,
      style: TextStyle(color: Colors.brown),
    ),
  );
}
