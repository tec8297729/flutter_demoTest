import 'package:flexible/pages/HomeBarTabs/Search/components/MyAppBar/MyAppBar.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('搜索内容'),
          ],
        ),
      ),
    );
  }
}
