import 'package:flutter/material.dart';

class HomeForYouTabs extends StatefulWidget {
  HomeForYouTabs({Key key, this.child});
  final Widget child;

  @override
  _HomeForYouTabsState createState() => _HomeForYouTabsState();
}

class _HomeForYouTabsState extends State<HomeForYouTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 添加一个滚动容器
      child: ListView(
        // scrollDirection: Axis.vertical, // 垂直方向
        children: <Widget>[
          SizedBox(height: 10),
          ImageContainer(),
          SizedBox(height: 20),
          InstalledApps(),
          SizedBox(height: 20),
          RecommendedApps(),
        ],
      ),
    );
  }

  // 顶部静态图片
  Widget ImageContainer() {
    return Container(
      height: 200,
      child: Image.network(
        'http://p3.so.qhmsg.com/t01a3d1f70ae0fa3b00.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  // 横向滚动的介绍APP列表
  Widget InstalledApps() {
    return Material(
      color: Colors.white,
      elevation: 14, // 添加阴影
      shadowColor: Color(0x802196F3), // 阴影颜色
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: labelContainer('Previously installed apps'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: appsRecommendedContainer(),
          ),
        ],
      ),
    );
  }

  // 标题
  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Text(
            'MORE',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  // app_item图片url, 图片名称，评分
  Widget imageSection(String imageVal, String appVal, String rateVal) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20), // 圆边20
          ),
        ),
        SizedBox(height: 10),
        Text(
          appVal,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 10),
        Text(
          rateVal,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 第一栏app商品介绍区域
  Widget appsRecommendedContainer() {
    return Container(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://p0.ssl.qhimgs1.com/sdr/400__/t019c34ef6c653a0034.jpg',
              'Amazon Kindle',
              '4.2'),
          SizedBox(
            width: 20,
          ),
          imageSection(
              'https://p3.ssl.qhimgs1.com/sdr/400__/t01261ea215f2a29b69.jpg',
              'Audible',
              '4.5'),
          SizedBox(
            width: 20,
          ),
          imageSection(
              'https://p3.ssl.qhimgs1.com/sdr/400__/t014d20487d227e72f9.jpg',
              '',
              '4.1'),
          SizedBox(
            width: 20,
          ),
          imageSection(
              'https://p3.ssl.qhimgs1.com/sdr/400__/t01dfb90b98b485cd83.jpg',
              '',
              '4.7'),
        ],
      ),
    );
  }

  // 第二栏商品介绍
  Widget RecommendedApps() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('Recommended for you'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: appsContainer(),
          ),
        ],
      ),
    );
  }

  // 商品介绍列表布局
  Widget appsContainer() {
    return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://p0.ssl.qhimgs1.com/sdr/400__/t0130a970e25da28166.jpg',
              'Faceebook',
              '4.1'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://p0.ssl.qhimgs1.com/sdr/400__/t01acaf1729460ff92a.jpg',
              'Linkedin',
              '4.6'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://p3.ssl.qhimgs1.com/sdr/400__/t01a46af2eb57008e9d.jpg',
              'Netflix',
              '4.8'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://p3.ssl.qhimgs1.com/sdr/400__/t0118753b59277c2cc9.jpg',
              'Flutter',
              '5.0'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://p1.ssl.qhimgs1.com/sdr/400__/t012f5bc94bcd3af15b.jpg',
              'Pinterest',
              '4.9'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://p5.ssl.qhimgs1.com/sdr/400__/t0151c1d685426a7155.jpg',
              'Instagram',
              '4.8'),
        ],
      ),
    );
  }
}
