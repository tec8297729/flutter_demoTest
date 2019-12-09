import 'package:flutter/material.dart';

class GameTopChartsTabs extends StatefulWidget {
  int colorVal;
  GameTopChartsTabs(this.colorVal);

  _GameTopChartsTabsState createState() => _GameTopChartsTabsState();
}

class _GameTopChartsTabsState extends State<GameTopChartsTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 初始化，定义tabs长度
    _tabController = new TabController(vsync: this, length: 5);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffEFF0F1),
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
        child: innerNestedTabs(),
      ),
    );
  }

  Widget innerNestedTabs() {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    labelPadding: EdgeInsets.all(10.0),
                    indicatorColor: Color(widget.colorVal),
                    indicatorWeight: 5.0,
                    tabs: [
                      // 标签栏定义
                      _textItem("TOP FREE", 0),
                      _textItem("TOP GROSSING", 1),
                      _textItem("TRENDING", 2),
                      _textItem("TOP PAID", 3),
                      _textItem("TOP RATED", 4),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          // 切换标签栏显示的内容，相应tab索引显示相应数组中的组件
          children: <Widget>[
            TopFreeApps(),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP GROSSING')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TRENDING')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP PAID')),
            ),
            Container(
              height: 200.0,
              child: Center(child: Text('TOP RATED')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textItem(String text, int index) {
    return Text(
      text,
      style: TextStyle(
        color: _tabController.index == index
            ? Color(widget.colorVal)
            : Colors.black,
      ),
    );
  }

  Widget TopFreeApps() {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: 40.0),
          ListTile(
            leading: Container(
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      'https://p0.ssl.qhimgs1.com/sdr/400__/t013fee8f659091dcaa.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            title: Text(
              'DRAGON BALL',
            ),
            subtitle: Text('Bandai Namco'),
          ),
          SizedBox(height: 40.0),
          ListTile(
            leading: Container(
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      'https://p1.ssl.qhimgs1.com/sdr/400__/t0198bc2d42ff34daa1.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            title: Text(
              'Jewels Classic',
            ),
            subtitle: Text('Jewel - Lazy Chick'),
          ),
          SizedBox(height: 40.0),
          ListTile(
            leading: Container(
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      'https://p0.ssl.qhimgs1.com/sdr/400__/t013929213faa97a4d0.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            title: Text(
              'Street Racing 3D',
            ),
            subtitle: Text('Ivy Racing'),
          ),
          SizedBox(height: 40.0),
          ListTile(
            leading: Container(
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new NetworkImage(
                      'https://p3.ssl.qhimgs1.com/sdr/400__/t01138c2a6cdf855e63.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            title: Text(
              'Dream League Soccer 2019',
            ),
            subtitle: Text('Sports'),
          ),
        ],
      ),
    );
  }
}
