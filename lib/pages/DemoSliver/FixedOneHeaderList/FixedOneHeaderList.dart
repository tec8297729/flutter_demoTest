import 'package:flutter/material.dart';

class FixedOneHeaderList extends StatefulWidget {
  @override
  _FixedOneHeaderListState createState() => _FixedOneHeaderListState();
}

class _FixedOneHeaderListState extends State<FixedOneHeaderList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: ClampingScrollPhysics(), // 创建滚动物理特性，防止滚动偏移超出内容的边界。
        // 返回头部bar组件数组
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            // 里面全是放sliver系列组件
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                leading: SizedBox(),
                brightness: Brightness.dark,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    tooltip: '搜索',
                    icon: Icon(
                      Icons.accessible_forward,
                      color: Colors.black,
                    ),
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                expandedHeight: 100.0,
                floating: false, // 不随着滑动隐藏标题
                pinned: true, // 固定在顶部
                // 头部背景色
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Demo',
                    style: TextStyle(color: Colors.red),
                  ),
                  background: Container(
                    height: 213.0,
                    color: Color(0xFF18191A),
                  ),
                  centerTitle: true,
                  collapseMode: CollapseMode.pin, // 滚动时折叠效果
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true, // 置顶头部
              floating: false, // 不随着滑动隐藏,是否浮动并且隐藏标题栏
              // SliverPersistentHeaderDelegate是一个abstract类，需要自己实现
              delegate: SliverAppBarDelegate(
                height: 80,
                child: Container(
                  height: 80.0,
                  color: Color(0xFF18191A),
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBar(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                    controller: _tabController,
                    labelColor: Color(0xFFB8B8B8),
                    unselectedLabelColor: Color(0xFFB8B8B8),
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: const TextStyle(fontSize: 14),
                    indicatorColor: Colors.transparent,
                    tabs: const <Widget>[
                      Text('新订单'),
                      Text('待配送'),
                      Text('待完成'),
                      Text('已完成'),
                      Text('已取消')
                    ],
                    onTap: (index) {},
                  ),
                ),
              ),
            ),
          ];
        },
        // 内容显示区域
        body: PageView.builder(
          key: const Key('pageView'),
          itemCount: 5,
          onPageChanged: (int _int) {},
          // controller: _pageController,
          itemBuilder: (_, index) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < 100; i++) Text('data$i'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 自己实现这个类
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  SliverAppBarDelegate({this.child, this.height});

  // minHeight 和 maxHeight 的值设置为相同时，header就不会收缩了
  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    oldDelegate.maxExtent; // 自定义判断,返回false者不重新渲染组件,优化部份
    return true;
  }
}
