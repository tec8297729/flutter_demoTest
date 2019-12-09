import 'package:flutter/material.dart';
import 'GameTopChartsTabs.dart';

class GamesTopTabs extends StatefulWidget {
  GamesTopTabs(this.colorVal);
  int colorVal;

  @override
  _GamesTopTabsState createState() => _GamesTopTabsState();
}

class _GamesTopTabsState extends State<GamesTopTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 定义tab长度8个
    _tabController = TabController(vsync: this, length: 8);
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
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // 隐藏默认回退按钮
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 4.0,
            indicatorColor: Color(0xff3f51b5),
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: <Widget>[
              _tabItem(
                icon: Icons.contact_mail,
                text: 'For You',
                index: 0,
              ),
              _tabItem(
                icon: Icons.insert_chart,
                text: 'Top Charts',
                index: 1,
              ),
              _tabItem(
                icon: Icons.public,
                text: 'New',
                index: 2,
              ),
              _tabItem(
                icon: Icons.screen_lock_portrait,
                text: 'Premium',
                index: 3,
              ),
              _tabItem(
                icon: Icons.shopping_basket,
                text: 'Category',
                index: 4,
              ),
              _tabItem(
                icon: Icons.calendar_today,
                text: 'Events',
                index: 5,
              ),
              _tabItem(
                icon: Icons.store_mall_directory,
                text: 'Editors choice',
                index: 6,
              ),
              _tabItem(
                icon: Icons.sentiment_very_satisfied,
                text: 'Family',
                index: 7,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: Text("For you Tabs"),
            ),
            // 第三层tabs标签，里面还可以在嵌套tabs
            GameTopChartsTabs(0xff3f51b5),
            Center(child: Text('New')),
            Center(child: Text('Premium')),
            Center(child: Text('Category')),
            Center(child: Text('Events')),
            Center(child: Text('Editor Choice')),
            Center(child: Text('Family')),
          ],
        ),
      ),
    );
  }

  Widget _tabItem({IconData icon, int index, String text}) {
    Color isColor =
        _tabController?.index == index ? Color(widget.colorVal) : Colors.grey;
    return Tab(
      icon: Icon(icon, color: isColor),
      child: Text(
        text,
        style: TextStyle(color: isColor),
      ),
    );
  }
}
