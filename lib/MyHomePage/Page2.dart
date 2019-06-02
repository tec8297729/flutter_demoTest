import 'package:flutter/material.dart';
class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  _Page2State createState() => _Page2State();
}
// 这是一个有状态组件，因为需要更新视图
class _Page2State extends State<Page2> {
  int index = 0; // 接收bar当前点击索引
  // 创建一组list列表，里面多个组件，用于调用显示某一个组件
  List<Widget> Pages = [
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
    Container(color: Colors.green,),
    Container(color: Colors.orange,),
  ];

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color:Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar标题'),
      ),
      // 设置底部tab标签，items内必须设置每个icon颜色及bar的title标题，否则报错
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 只有设置fixed类型，底部bar才会显示所有的文字
        currentIndex: index, // 当前活动的bar索引
        // 点击了的时候把当前索引存起来
        onTap: (int idx){
          setState(() {
            index = idx; // 更新视图
          });
        },
        items: [
          BottomNavigationBarItem(
            // 当切换到索引0的时候，此bar图片变成红色，否则是黑色
            icon: Icon(Icons.add, color: (index == 0 ? Colors.red : Colors.black),),
            title: Text('Add', style: TextStyle(color:Colors.black),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black,),
            title: Text('account_circle', style: textStyle,)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close, color: Colors.black,),
            title: Text('close', style: TextStyle(color:Colors.black),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build, color: Colors.black,),
            title: Text('build', style: TextStyle(color:Colors.black),)
          ),
        ],
      ),
      // 主体内容部份，根据bar切换内容也会变换
      body: Pages[index],
    );
  }
}

