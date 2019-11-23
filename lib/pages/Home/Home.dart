import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flexible/utils/dio/safeRequest.dart'; // 请求底层
import 'package:flexible/stores/counterStore/counterStore.dart'; // 状态管理

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  CounterStore _counter; // mobx中的counter实例化

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    _counter.increment(); // mobx中的值 加加value

    // 请求组件使用，同dio组件request方法
    // safeRequest('http://yapi.demo.qunar.com/mock/1311/data').then((res) {
    //   print(res['num']);
    // });
  }

  @override
  Widget build(BuildContext context) {
    _counter = Provider.of<CounterStore>(context); // 实例化类，可多页共享数据

    return Scaffold(
      appBar: AppBar(
        title: Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            btnWidget("底部栏带动画效果", "/extendedNavBar"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget btnWidget(String text, String routeName) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        child: Text(text),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
