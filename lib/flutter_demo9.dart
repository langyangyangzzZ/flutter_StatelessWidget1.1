import 'package:flutter/material.dart';

/*
*  初始化
*  createState() initState()
*
* 更新
* didChangeDependencies()  build()  didUpdateWidget()
*
* 销毁
* deactivate()  dispose()
* */
//Flutter中Widget生命周期以及应用周期
class Flutter_Demo9 extends StatefulWidget {
  @override
  _Flutter_Demo9State createState() => _Flutter_Demo9State();
}

//需要用到WidgetsBindingObserver来监听应用生命周期
class _Flutter_Demo9State extends State<Flutter_Demo9>  with WidgetsBindingObserver {
  int _mTapIndex = 0;
  @override
  void initState() {
    //绑定WidgetsBinding
    WidgetsBinding.instance.addObserver(this);
    // TODO: implement initState
    print("1028:---initState---");
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("1028__staate: ${state}");
    if(state == AppLifecycleState.paused){
      print("didChangeAppLifecycleState:进入后台");
    }else if(state == AppLifecycleState.resumed){
      print("didChangeAppLifecycleState:进入前台");
    }else if(state == AppLifecycleState.inactive){
      //不常用  应用程序处于非活动状态,并且接收输入回调时调用 比如:接电话
      print("didChangeAppLifecycleState:inactive");
    }else if(state == AppLifecycleState.suspending){
      //不常用 应用程序被调起时调用 IOS不会触发
      print("didChangeAppLifecycleState:suspending");
    }
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("1028:---didChangeDependencies---");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("1028:---build---");
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter中Widget声明周期以及应用声明周期"),
        leading: GestureDetector(
          onTap: () {
            returnPage();
          },
          child: BackButton(),
        ),
      ),
      body: Container(
        child:Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  _mTapIndex ++;

                });
              },
              child: Icon(
                Icons.android,
                size: 100,
              ),
            ),
            Text('${_mTapIndex}'),
          ],
        )

      ),
    );
  }

  @override
  void didUpdateWidget(Flutter_Demo9 oldWidget) {
    print("1028:---didUpdateWidget---");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("1028:---deactivate---");
    super.deactivate();
  }

  @override
  void dispose() {
    //解定WidgetsBinding
    WidgetsBinding.instance.removeObserver(this);
    print("1028:---dispose---");
    super.dispose();
  }

  returnPage() {
    Navigator.pop(context);
  }
}
