import 'package:flutter/material.dart';

import 'HomeForYouTabs.dart';
import 'HomeTopChartsTabs.dart';

class HomeTopTab extends StatefulWidget {
  HomeTopTab(this.colorVal);
  final int colorVal; // 第二层tab图标及文字颜色

  @override
  _HomeTopTabState createState() => _HomeTopTabState();
}

class _HomeTopTabState extends State<HomeTopTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    // 监听tab事件
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 当点击tab时监听事件处理
  void _handleTabSelection() {
    // 更新视图，为了让选中的文字变色
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSize(),
      // 内容区域
      body: TabBarView(
        controller: _tabController, // 控制器，和上面tabs关联起来
        children: <Widget>[
          HomeForYouTabs(),
          HomeTopChartsTabs(),
          Container(
            height: 200.0,
            child: Center(child: Text('Category')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Family')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Early Access')),
          ),
          Container(
            height: 200.0,
            child: Center(child: Text('Editor Choice')),
          ),
        ],
      ),
    );
  }

  // 定义appBar组件及高度
  Widget _appBarSize() {
    Size _size = Size.fromHeight(90);
    return PreferredSize(
      preferredSize: _size, // 指定AppBar高度
      child: Container(
        color: Colors.red, // 调度层，设置背景色
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, // false为隐藏左侧区域
              // 显示在 AppBar 下方的控件，高度可自定义
              flexibleSpace: Container(
                height: _size.height, // 父元素相同高度
                // color: Colors.yellow,
                child: TabBar(
                  controller: _tabController, // 控制器，主要可以获取tabBar方法
                  isScrollable: true,
                  indicatorWeight: 4,
                  indicatorColor: Color(0xffff5722),
                  unselectedLabelColor: Colors.grey,
                  tabs: <Widget>[
                    _tabItem(
                      icon: Icons.contact_mail,
                      index: 0,
                      text: 'For You',
                    ),
                    _tabItem(
                      icon: Icons.card_giftcard,
                      index: 1,
                      text: 'Top Charts',
                    ),
                    _tabItem(
                      icon: Icons.screen_share,
                      index: 2,
                      text: 'Categories',
                    ),
                    _tabItem(
                      icon: Icons.contact_mail,
                      index: 3,
                      text: 'Family',
                    ),
                    _tabItem(
                      icon: Icons.strikethrough_s,
                      index: 4,
                      text: 'Early Access',
                    ),
                    _tabItem(
                      icon: Icons.beenhere,
                      index: 5,
                      text: 'Editors choice',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 头tabs选择卡显示组件封装
  Widget _tabItem({String text, int index, IconData icon}) {
    // 选中时指定颜色
    var isSelectColor =
        _tabController.index == index ? Color(widget.colorVal) : Colors.grey;

    return Tab(
      icon: Icon(icon, color: isSelectColor),
      child: Text(
        text,
        style: TextStyle(color: isSelectColor),
      ),
    );
  }
}
