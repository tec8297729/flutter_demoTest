import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      // 模板风格
      theme: ThemeData(
        primarySwatch: Colors.blue, // 顶部和一些工具都变成了蓝色风格
      ),
      // home: MyHomePage(title: 'Flutter标题'), // APP页面标题，使用了另一个组件MyHomePage
      // home: Myapp(), // 显示带底部bar图标的
      // 设置路由，
      routes: routesInit, // 方式二：抽离路由组件
      // routes: {
      //   '/': (context) {
      //     return MyHomePage(title: 'home组件');
      //   }, // 定义路由语法方式，注意分号添加
      //   '/page2': (context) {
      //     return Page2();
      //   }, // 定义路由语法方式，注意分号添加
      //   '/page3': (context) {
      //     return Page3(
      //       textData: null,
      //     );
      //   }, // 定义路由语法方式，注意分号添加
      // },
      initialRoute: initialRoute, // 默认显示哪个路由地址
    );
  }
}
