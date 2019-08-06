import 'package:flutter/material.dart';
// 以下各路由页面显示的组件
import 'package:flutter_demo/MyHomePage/MyHomePage.dart';
import 'package:flutter_demo/MyHomePage/Page2.dart';
import 'package:flutter_demo/MyHomePage/Page3.dart';

String initialRoute = '/'; // 初始默认显示的路由
Map<String, WidgetBuilder> routesInit = {
  '/': (context) {
    return MyHomePage(title: 'home组件2');
  }, // 定义路由语法方式，注意分号添加
  '/page2': (context) {
    return Page2();
  }, // 定义路由语法方式，注意分号添加
  '/page3': (context) {
    return Page3(
      textData: null,
    );
  }, // 定义路由语法方式，注意分号添加
};
