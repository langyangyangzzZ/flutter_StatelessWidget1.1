import 'package:flutter/material.dart';

//StatefluWidget与基础组件
class Flutter_Demo5 extends StatefulWidget {
  @override
  _Flutter_Demo5State createState() => _Flutter_Demo5State();
}

class _Flutter_Demo5State extends State<Flutter_Demo5> {
  int mIndex = 0;

  var mController;
  FocusNode focusNode;

  String mValue;

  int _mPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    String mErrorText;
    return MaterialApp(
      title: "StatefluWidget与基础组件",
      //主题
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
      //暗主题
      darkTheme:
          ThemeData(primarySwatch: Colors.yellow, brightness: Brightness.dark),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Container(
            color: Colors.white,
            width: 300,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("drawer1"),
                ),
                Container(
                  child: Text("drawer2"),
                ),
                Container(
                  child: Text("drawer3"),
                )
              ],
            ),
          ),
          primary: true,
          //AppBar标题是否显示完整 默认是true
          floatingActionButton: FloatingActionButton(
            child: Text("点我"),

          ),
          bottomSheet: Text("bottomSheet"),
          endDrawer: Container(
            //右侧Drawer
            color: Colors.white,
            width: 300,
            height: 300,
            child: Text("endDrawer"),
          ),
          persistentFooterButtons: <Widget>[
            Container(
              child: Text("按钮一"),
            ),
            Container(
              child: Text("按钮二"),
            ),
          ],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mIndex,
            onTap: (index) {
              setState(() {
                mIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.cached), //默认状态
                activeIcon: Icon(
                  //选中状态
                  Icons.cached,
                  color: Colors.green,
                ),
                title: Text("刷新"), //颜色跟随主题颜色变化
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                activeIcon: Icon(
                  Icons.ac_unit,
                  color: Colors.green,
                ),
                title: Text("雪花"),
              )
            ],
          ),
          appBar: AppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: (){
                Navigator.pop(context);
              },
            ),

            //此按钮会和draw按钮重复

            title: Text("StatefluWidget与基础组件"),
            //按钮显示文字
            actions: <Widget>[
              //右边显示//此按钮会和endDraw按钮重复
              Container(
                child: Text("actions"),
              ),
            ],
            shape: RoundedRectangleBorder(
                //AppBar形状
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: Colors.red,
            //背景色 默认跟随主题色
            brightness: Brightness.light,
            //状态栏亮度
            iconTheme: IconThemeData(
                color: Colors.blue, //AppBar中leading的颜色
                opacity: 0.8 //AppBar中leading的透明度  1不透明
                ),

            //阴影
            elevation: 20,

            //AppBar透明度
            toolbarOpacity: 0.7,
            //botton透明度
            bottomOpacity: 0.7,

            bottom: mIndex != 0 ? initTabBar() : null,
          ),
          body: mIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: <Widget>[
                      Image.network(
                        //添加网络图片
                        "http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg",
                        width: 100,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      Image.asset("images/green.jpeg", width: 100, height: 150),
                      TextField(
//                          obscureText:true,//隐藏文字
                        keyboardType: TextInputType.number,
                        //设置键盘弹出类型
                        textInputAction: TextInputAction.next,
                        //键盘按钮右下角按钮
                        textCapitalization: TextCapitalization.characters,
                        //大小写控制(我看不出效果!)
                        cursorColor: Colors.yellow,
                        //光标颜色
                        cursorWidth: 10,
                        //光标宽度
                        cursorRadius: Radius.circular(20),
                        //光标圆角
                        maxLines: 3,
                        //最大行数
                        minLines: 1,
                        //最小行数
                        maxLength: 8,
                        //最大输入字符
                        controller: mController = new TextEditingController(),
                        //初始化控制器controller
                        focusNode: focusNode = new FocusNode(),
                        //配置关闭软件按钮
//                        decoration: InputDecoration.collapsed(hintText: "无下划线"),//无下划线输入框

                        decoration: InputDecoration(
                            //右下角最大输入样式
                            counter: Text("最大输入字符"),
                            icon: Icon(Icons.accessibility),
                            //左侧图标
                            prefixIcon: Icon(Icons.title),
                            //左侧内图标
                            suffixIcon: IconButton(
                              //右侧图标
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                print('SZJonPressed');
                                mController?.clear(); //清除文字
                                focusNode?.unfocus(); //关闭软键盘
                              },
                            ),
                            helperText: "请输入手机号",
                            //帮助提示
                            helperStyle: TextStyle(color: Colors.green),
                            hintText: "请输入",
                            //hint提示
                            labelText: "账号",
                            //悬浮提示 先显示lableText在显示hintText
                            errorText: "请正确输入手机号",
                            errorMaxLines: 5,
                            //错误提示
//                      errorBorder: OutlineInputBorder(),

                            border: OutlineInputBorder(
                              //设置边框
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)), //设置圆角
                            )),

                        onChanged: (value) {
                          //响应回调
                          print('当前输入的是${value}');
                          mValue = value;
                        },
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 30),
                        child: PageView(
                            scrollDirection: Axis.vertical,//设置滑动方向  默认是Axis.horizontal
                          controller: PageController(
                            viewportFraction: 0.9,//设置每一个Page不占满屏幕,漏出上一个和下一个Page!
                              initialPage: 0,//设置默认Page
                             keepPage: true//是否保存当前滚动page

                          ),
                          onPageChanged: (index){
                            print("SZJonPageChanged${index}\t\t");
                          },

                          children: <Widget>[
                            initPageViewItem("page1", Colors.green),
                            initPageViewItem("page2", Colors.yellow),
                            initPageViewItem("page3", Colors.red),
                            initPageViewItem("page4", Colors.blue),
                          ],
                        ),
                      )
                    ],
                  ),
                  onRefresh: initRefresh,
                  //必写参数
                  color: Colors.green,
                  //指示器颜色
                  backgroundColor: Colors.yellow,
                  //背景颜色
                  displacement: 20, //下拉距离
                )
              : TabBarView(
                  ////使用TabBarView来响应
                  children: <Widget>[
                    initTabitem("page1", Colors.blue),
                    initTabitem("page2", Colors.red),
                    initTabitem("page3", Colors.yellow),
                  ],
                ),
        ),
      ),
      color: Colors.pink,
      routes: <String, WidgetBuilder>{
        //定义跳转路由
      },
      supportedLocales: <Locale>[
        const Locale('en', 'US'),
        const Locale('fi', 'FI'),
      ],
      debugShowCheckedModeBanner: false, //右上角DEBUG图标 默认为true
//      showPerformanceOverlay: true,//打开性能监控，覆盖在屏幕最上面，默认false
//        checkerboardOffscreenLayers:true,//打开渲染到屏幕外位图的图层的checkerboarding。，默认false
//    debugShowMaterialGrid: true,//显示网格，默认false
//        checkerboardRasterCacheImages:true,//打开光栅缓存图像的检查板，默认false
    );
  }

  initTabitem(String s, Color color) {
    return Container(
      color: color,
      child: Text(s),
    );
  }

  Future<Null> initRefresh() async {
    await Future.delayed(new Duration(milliseconds: 1000)); //刷新1s
    return null;
  }

  initTabBar() {
    return TabBar(
      isScrollable: false,
      //是否可滚动
      tabs: <Widget>[
        //TabBar子Tab
        Tab(
          text: "page1",
          icon: Icon(Icons.call),
        ),
        Tab(
          text: "page2",
          icon: Icon(Icons.save),
        ),
        Tab(
          text: "page3",
          icon: Icon(Icons.data_usage),
        ),
      ],
      indicatorColor: Colors.greenAccent,
      //指示器选中颜色
      indicatorPadding: EdgeInsets.zero,
      //指示器内边距
//                indicator: BoxDecoration(//选中颜色(指示器与选中颜色只能选一个)
//                  color: Colors.deepOrange,
//                ),
      indicatorSize: TabBarIndicatorSize.tab,
      //tab指示器计算方式TabBarIndicatorSize.lable与文字等宽
      labelColor: Colors.blue,
      //Tab默认颜色
      labelStyle: TextStyle(fontSize: 18),
      //Tab样式
      labelPadding: EdgeInsets.all(5),
      //Tab内边距
      unselectedLabelColor: Colors.yellow,
      //Tab未选中颜色
      unselectedLabelStyle: TextStyle(fontSize: 15),
      //Tab为选中样式
      onTap: (index) {
        mIndex = index;
        print('现在是第:${index}个');
      },
    );
  }

  initPageViewItem(String s, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(s),
    );
  }
}
