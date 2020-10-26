import 'package:flutter/material.dart';

class Flutter_Demo2 extends StatefulWidget {
  Flutter_Demo2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Flutter_Demo2State createState() => _Flutter_Demo2State();
}

class _Flutter_Demo2State extends State<Flutter_Demo2> {
  int _counter = 0;
  Widget mContainer;

  @override
  Widget build(BuildContext context) {
    if (_counter == 0) {
      mContainer = initLayout1();
    } else if (_counter == 1) {
      mContainer = initLayout2();
    } else {
      mContainer = initLayout3();
    }
    return MaterialApp(
      title: 'Flutter Demo2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                child: Text("111111111",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
              Container(
                child: Text("111111111",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
              Container(
                child: Text("111111111",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
              Container(
                child: Text("111111111",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _counter,
          onTap: (index) {
            setState(() {
              print("szj1020 :$_counter+ index: $index");
              _counter = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                //默认颜色
                Icons.android,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                //选中颜色
                Icons.android,
                color: Colors.blue,
              ),
              title: Text("android"),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  //默认颜色
                  Icons.ac_unit,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  //选中颜色
                  Icons.ac_unit,
                  color: Colors.blue,
                ),
                title: Text("雪花")),
            BottomNavigationBarItem(
                icon: Icon(
                  //默认颜色
                  Icons.cached,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  //选中颜色
                  Icons.cached,
                  color: Colors.blue,
                ),
                title: Text("刷新"))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("点我"),
          onPressed: null,
        ),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("FlutterDemo2"),

        ),
        body: RefreshIndicator(
          //刷新控件
          child: ListView(
            children: <Widget>[
              mContainer,
            ],
          ),
          onRefresh: initRefresh,
        ),
      ),
    );
  }

  Container initLayout1() {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        alignment: Alignment.bottomLeft,
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
            ),
            Image.network(
              "http://www.devio.org/img/avatar.png",
              width: 200,
              height: 200,
            ),
            TextField(
              maxLength: 6,
              decoration: InputDecoration(
                  icon: Icon(Icons.print),
                  hintText: "请输入账号",
                  hintStyle: TextStyle(fontSize: 25, color: Colors.yellow)),
            ),
            Container(
              alignment: Alignment.center, //居中
              height: 100,
              decoration: BoxDecoration(color: Colors.green), //Container容器
              child: PageView(
                children: <Widget>[
                  initPageViewItem("page1", Colors.yellow),
                  initPageViewItem("page2", Colors.red),
                  initPageViewItem("page3", Colors.blue),
                  initPageViewItem("page4", Colors.deepOrange),
                ],
              ),
            )
          ],
        ));
  }

  Future<Null> initRefresh() async {
    await Future.delayed(new Duration(milliseconds: 1000)); //刷新4s
    return null;
  }

  initPageViewItem(String title, Color color) {
    return Container(
      alignment: Alignment.center, //字体居中
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(color: Colors.deepPurple), //字体颜色
      ),
    );
  }

  Widget initLayout2() {
    return Container(
        //用于水平布局
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: <Widget>[
            Row(
              //用来垂直布局
              children: <Widget>[
                ClipOval(
                  //用于裁剪圆形
                  child: SizedBox(
                    //用来约束圆角宽和高
                    width: 100,
                    height: 100,
                    child: Image.network("http://www.devio.org/img/avatar.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ClipRRect(
                    //用于圆角裁剪
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    //裁剪圆角为30,并且透明度为80%
                    child: Opacity(
                      //用于设置透明度
                      opacity: 0.8, //设置透明度为80%
                      child: Image.network(
                        "http://www.devio.org/img/avatar.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.center,
                height: 200,
                padding: EdgeInsets.all(30), //设置padding边距30
                child: PhysicalModel(
                  //裁剪PageView
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias, //设置抗锯齿 这个必须加!!
                  color: Colors.transparent,
                  child: PageView(
                    children: <Widget>[
                      initPageViewItem("雪花pager1", Colors.deepOrange),
                      initPageViewItem("雪花pager2", Colors.brown),
                      initPageViewItem("雪花pager3", Colors.amber),
                      initPageViewItem("雪花pager4", Colors.cyan),
                      initPageViewItem("雪花pager5", Colors.green),
                    ],
                  ),
                )),
            Container(
              color: Colors.pink,
              padding: EdgeInsets.only(top: 30), //设置容器上边距为30
              child: FractionallySizedBox(
                widthFactor: 1, //设置百分比占满1代表全占满  0.3表示代表占满屏幕30%
                child: Text(
                  "宽度撑满",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget initLayout3() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network("http://www.devio.org/img/avatar.png"),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                  child: Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Opacity(
                        //设置透明度
                        opacity: 0.5,
                        child: Image.network(
                            "http://www.devio.org/img/avatar.png"),
                      )))
            ],
          ),
          Container(
            child: Wrap(
              spacing: 5, //间距
              runSpacing: 20, //上下间距
              children: <Widget>[
                _itemChip("Flutter"),
                _itemChip("Android"),
                _itemChip("IOS"),
                _itemChip("HTML"),
                _itemChip("C"),
                _itemChip("C++"),
                _itemChip("Pathyon"),
                _itemChip("PHP"),
                _itemChip("java"),
                _itemChip("kotion"),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Image.network(
                "http://www.devio.org/img/avatar.png",
                width: 100,
                height: 100,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.network(
                  "http://www.devio.org/img/avatar.png",
                  width: 40,
                  height: 40,
                ),
              )
            ],
          ),
          Container(
              height: 200,
              child: PhysicalModel(
                color: Colors.transparent, //必须加
                clipBehavior: Clip.antiAlias, //必须加
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                child: PageView(
                  children: <Widget>[
                    PageViewItem("A", Colors.black),
                    PageViewItem("B", Colors.blue),
                    PageViewItem("C", Colors.red),
                    PageViewItem("D", Colors.yellow),
                  ],
                ),
              )),
          Container(
            decoration: BoxDecoration(color: Colors.green),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Text("宽度撑满"),
            ),
          )
        ],
      ),
    );
  }

  _itemChip(String lable) {
    return Chip(
      label: Text(lable),
      avatar: CircleAvatar(
        backgroundColor: Colors.black87,
        child: Text(lable.substring(0, 1)),
      ), //圆形头像
    );
  }

  PageViewItem(String itemtitle, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Text(
        itemtitle,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
