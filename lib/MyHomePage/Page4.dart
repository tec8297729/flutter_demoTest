import 'package:flutter/material.dart';
// 
/* 
按“r” 热重载变化运行时
按“R” 热重启(和重建状态)

h键：帮助
q键：退出

p键 可以开启组件边框线的功能（每个组件都会显示外边线-调试用）
o键 可以切换IOS模式、安卓模式
 */
class Page3 extends StatelessWidget {
  // 接收外部组件传入的参数textData
  const Page3({Key key, @required this.textData}) : super(key: key);
  final String textData; // 变量保存，final初始化变量类型声明，只可以设置一次


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page3页面'),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          child: MyList(),
        ),
      ),
      // 右下角按钮，演示测试发送数据给上一页面
      floatingActionButton: FloatingActionButton(
        // 点击按钮的事件
        onPressed: () {
          // 回退上级页面，传递参数过去
          Navigator.pop(context, false);
        },
      ),
    );
  }
}

// 独立抽离组件
class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180.0,
          color: Colors.lightBlue,
        ),
        Container(
          width: 180.0,
          color: Colors.amber,
        ),
        Container(
          width: 180.0,
          color: Colors.deepOrange,
          child: ListView(
            children: <Widget>[
              Image.network('http//www.jonhuu.com/1.png'),
              Text('我是文本')
            ],
          ),
        ),
        Container(
          width: 180.0,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}
