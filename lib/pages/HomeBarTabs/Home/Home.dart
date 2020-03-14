import 'package:flexible/components/IntroduceBtn/IntroduceBtn.dart';
import 'package:flexible/model/ListDataModel/listData_m.dart';
import 'package:flexible/routes/routeName.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/homeStore.p.dart';

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ListDataModel> listData = Provider.of<HomeStore>(context).homeListData;

    return Scaffold(
      appBar: AppBar(
        title: Text('home页面'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            // 生成demo列表
            for (var i = 0; i < listData.length; i++)
              IntroduceBtn(
                text: listData[i].text,
                btnText: listData[i].btnText,
                routeName: listData[i].route,
              ),
          ],
        ),
      ),
    );
  }
}
