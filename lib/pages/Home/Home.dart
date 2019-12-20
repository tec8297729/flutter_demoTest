import 'package:flexible/components/IntroduceBtn/IntroduceBtn.dart';
import 'package:flexible/model/counterStore/counterStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            IntroduceBtn(
              btnText: "底部栏带动画效果",
              routeName: "/extendedNavBar",
            ),
            IntroduceBtn(
              text: '''从顶部tabs切换开始，每个页面内在内置嵌套多个tabs，每个tabs都是自定义显示内容区域''',
              btnText: "tabs嵌套多层级",
              routeName: "/tabsNContext",
            ),
            IntroduceBtn(
              text: '''默认顶部显示tabBar后，当滚动视图区域时，可滚动置顶AppBar组件，并且可支持多个。''',
              btnText: "tabBar滚动置顶多个",
              routeName: "/fixedAppBar",
            ),
            IntroduceBtn(
              // text: ''' ''',
              btnText: "step步进器",
              routeName: "/accountPage",
            ),
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
}
