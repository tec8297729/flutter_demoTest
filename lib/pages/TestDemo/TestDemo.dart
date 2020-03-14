import '../../utils/util.dart';
import 'package:flutter/material.dart';

class TestDemo extends StatefulWidget {
  TestDemo({Key key, this.params}) : super(key: key);
  final params;

  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test页面'),
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center();
        }),
      ),
    );
  }
}
