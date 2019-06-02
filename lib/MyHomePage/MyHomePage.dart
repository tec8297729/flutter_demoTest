import 'package:flutter/material.dart';
import './Page3.dart';
import 'package:http/http.dart' as http; // 引入第三方组件
import 'dart:convert'; // 用于JSON序列化

class MyHomePage extends StatefulWidget {
  // 接收外部传入的参数，如title,外部分可以传入这变量参数
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title; // 把title保存起来变量，供组件使用

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // List datas = []; // 定义一个list类型
  // 自定义函数，绑定到你需要的事件上
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // Navigator.pushNamed(context, '/page2'); // 跳转到了page2路由组件页面
    // 可以传递参数的跳转路由
    // Navigator.of(context).push(
    //   // 声明一个路由组件
    //   MaterialPageRoute(
    //     builder: (context){
    //       return Page3(textData: 'aaabbb'); // 跳转到某个组件中去，传递textData变量过去，内容aaabbb
    //     }
    //   )
    // ).then((value){
    //   print(value); // 这是pop回退页面接收到的值，pop回退的必须在push后面使用.then接收，是异步的
    // });
  }

  getData() async{
    final String host = 'https://jsonplaceholder.typicode.com/posts';
    return http.get(host); // get请求链接
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title), // 可以显示父组件的标题
      ),
      body: FutureBuilder(
        future: getData(), // 此组件自动调用此方法（自定义函数请求数据）
        // 返回值为显示内容, snap为请求后的res
        builder: (context, snap){
          // 判断没有数据时，snap参数是组件请求后的内容
          if(!snap.hasData){
            return Container(); // 当没有内容时，返回一个空内容
          }
          // 把请求后的body内容json序列化，这里可以把snap理解成node中res，也是有body的
          List datas = jsonDecode(snap.data.body); // 数据在data中的body内
          // 返回显示一个list列表
          return ListView.builder(
            itemCount: datas.length, // 列表长度
            // 每个列表渲染的内容
            itemBuilder: (context, idx){
              var data = datas[idx]; // 把当前数据读取出来
              // 渲染到这个页面上
              return ListTile(
                title: Text(data['title']), // 主标题
                subtitle: Text(data['body']), // 副标题
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData, // 点击按钮的事件
        tooltip: 'Increment',
        child: Icon(Icons.add), // 右下角按钮的图标
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
