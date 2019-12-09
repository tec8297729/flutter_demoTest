import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'index.dart';

class ExtendedNavBar extends StatefulWidget {
  ExtendedNavBar({Key key}) : super(key: key);

  _ExtendedNavBarState createState() => _ExtendedNavBarState();
}

class _ExtendedNavBarState extends State<ExtendedNavBar> {
  @override
  Widget build(BuildContext context) {
    return ExtendedNavigationBarScaffold(
      body: Container(
        color: Colors.blueAccent,
      ),
      elevation: 0,
      floatingAppBar: true,

      //首页到搜索框
      appBar: AppBar(
        shape: kAppbarShape,
        leading: IconButton(
          icon: Icon(
            MaterialCommunityIcons.access_point_network,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '扩展脚手架的示例',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      navBarColor: Colors.white,
      navBarIconColor: Colors.black,

      //更多按钮到数组
      moreButtons: [
        MoreButtonModel(
          icon: MaterialCommunityIcons.wallet,
          label: '钱包',
          onTap: () {},
        ),
        MoreButtonModel(
          icon: MaterialCommunityIcons.parking,
          label: '停车场',
          onTap: () {},
        ),
        MoreButtonModel(
          icon: MaterialCommunityIcons.car_multiple,
          label: '我到汽车',
          onTap: () {},
        ),
        MoreButtonModel(
          icon: FontAwesome.book,
          label: '书籍',
          onTap: () {},
        ),
        MoreButtonModel(
          icon: MaterialCommunityIcons.home_map_marker,
          label: '银行',
          onTap: () {},
        ),
        MoreButtonModel(
          icon: FontAwesome5Regular.user_circle,
          label: '我的',
          onTap: () {},
        ),
        null,
        MoreButtonModel(
          icon: MaterialCommunityIcons.settings,
          label: '设置',
          onTap: () {},
        ),
        null,
      ],

      //搜索
      searchWidget: Container(
        height: 50,
        color: Colors.yellow,
      ),

      parallexCardPageTransformer: PageTransformer(
        pageViewBuilder: (context, visibilityResolver) {
          //可以滑动到组件
          return PageView.builder(
            controller: PageController(viewportFraction: 0.85),
            itemCount: parallaxCardItemsList.length,
            itemBuilder: (context, index) {
              final item = parallaxCardItemsList[index];
              final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);
              return ParallaxCardsWidget(
                item: item,
                pageVisibility: pageVisibility,
              );
            },
          );
        },
      ),
    );
  }

  //page的具体内容
  final parallaxCardItemsList = <ParallaxCardItem>[
    ParallaxCardItem(
        title: '技术刚刚好',
        body: '技术刚刚好，学习笔记',
        background: Container(
          color: Colors.orange,
        )),
    ParallaxCardItem(
        title: '技术刚刚好2',
        body: '欢迎观看，欢迎关注',
        background: Container(
          color: Colors.redAccent,
        )),
    ParallaxCardItem(
        title: '技术刚刚好3',
        body: '欢迎收藏',
        background: Container(
          color: Colors.blue,
        )),
  ];
}
