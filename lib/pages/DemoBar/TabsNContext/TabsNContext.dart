import 'package:flutter/material.dart';
import 'components/GamesTopTabs/GamesTopTabs.dart';
import 'components/HomeTopTab/HomeTopTab.dart';
import 'components/MoviesTopTabs/MoviesTopTabs.dart';

Color primaryColor = Color(0xff109618);

class TabsNContext extends StatefulWidget {
  TabsNContext({Key key, this.params}) : super(key: key);
  final params;

  @override
  _TabsNContextState createState() => _TabsNContextState();
}

/* 内部嵌套多个tabs显示不同的内容，核心也就是以单个tabs实现，然后在tabsView中在套一个的tabs及tabsView，以达到可选多个tabs的页面效果
 */
class _TabsNContextState extends State<TabsNContext> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor, // 背景颜色
          title: Padding(
            padding: EdgeInsets.only(top: 8),
            child: _GooglePlayAppBar(),
          ),
          // 头部区域 底部下方组件
          bottom: TabBar(
            // tabs选项卡显示的组件
            tabs: <Widget>[
              _tabItem('HOME'),
              _tabItem('GAMES'),
              _tabItem('MOVIES'),
            ],
            isScrollable: true, // 是否可以水平滚动
            indicatorColor: Colors.white, // 定义选项卡下方线条颜色
            indicatorWeight: 6, // 底部下划线高度
            // 点击事件
            onTap: (index) {
              switch (index) {
                case 0:
                  primaryColor = Color(0xffff5722);
                  break;
                case 1:
                  primaryColor = Color(0xff3f51b5);
                  break;
                case 2:
                  primaryColor = Color(0xffe91e63);
                  break;
                default:
                  break;
              }
              setState(() {});
            },
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeTopTab(0xffff5722), //ff5722
            GamesTopTabs(0xff3f51b5), //3f51b5
            MoviesTopTabs(0xffe91e63), //e91e63
          ],
        ),
      ),
    );
  }

  // tabs选择卡显示组件封装
  Widget _tabItem(String text) {
    return Tab(
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

// 顶部Bar区域
Widget _GooglePlayAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.blueGrey,
            onPressed: () {
              print('菜单事件');
            },
          ),
        ),
        Expanded(
          child: Container(
            child: Text(
              'Google Play',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Container(
          child: IconButton(
            icon: Icon(
              Icons.mic,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              print('语音icon事件');
            },
          ),
        )
      ],
    ),
  );
}
