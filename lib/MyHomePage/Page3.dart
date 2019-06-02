import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  // 接收外部组件传入的参数textData
  const Page3({Key key, @required this.textData}) : super(key: key);
  final String textData; // 变量保存，final初始化变量类型声明，只可以设置一次
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page3页面'),),
      body: SizedBox.expand(
        child: Container(
          child: Text(textData), // 这个页面的内容是变量，变量外部传入的
        ),
      ),
      // 右下角按钮，演示测试发送数据给上一页面
      floatingActionButton: FloatingActionButton(
        // 点击按钮的事件
        onPressed: (){
          // 回退上级页面，传递参数过去
          Navigator.pop(context, false);
        }, 
      ),
    );
  }
}
