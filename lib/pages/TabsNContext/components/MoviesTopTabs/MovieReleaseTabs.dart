import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieReleaseTabs extends StatefulWidget {
  final Widget child;

  MovieReleaseTabs({Key key, this.child}) : super(key: key);

  _MovieReleaseTabsState createState() => _MovieReleaseTabsState();
}

class _MovieReleaseTabsState extends State<MovieReleaseTabs> {
  final List<String> imgList = [
    'https://p0.ssl.qhimgs1.com/sdr/400__/t018e2d6c0a26f26d54.jpg',
    'https://p3.ssl.qhimgs1.com/sdr/400__/t01406c10884842c449.jpg',
    'https://p2.ssl.qhimgs1.com/sdr/400__/t01c3425d50eb0e6d52.jpg',
    'https://p0.ssl.qhimgs1.com/sdr/400__/t01e299532d601f5620.jpg',
    'https://p2.ssl.qhimgs1.com/sdr/400__/t0130e689b250106a8c.jpg',
    'https://p1.ssl.qhimgs1.com/sdr/400__/t016a99ad3d160f0437.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          CarouselContainer(),
          SizedBox(
            height: 20.0,
          ),
          InstalledApps(),
          SizedBox(
            height: 20.0,
          ),
          RecommendedApps(),
        ],
      ),
    );
  }

  // 轮播图组件
  Widget CarouselContainer() {
    return CarouselSlider(
      viewportFraction: 0.9, // 视图成占比，1是满宽度
      aspectRatio: 2.0, // 长宽比占比，默认16/9
      autoPlay: true,
      enlargeCenterPage: true, // 是否无限循环
      // 轮播图片数组
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

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

  Widget InstalledApps() {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: labelContainer('Most Popular Movies'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: appsRecommendedContainer(),
          ),
        ],
      ),
    );
  }

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
                fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget imageSection(String imageVal, String appVal, String rateVal) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          appVal,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Text(
              rateVal,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget appsRecommendedContainer() {
    return Container(
        height: 160.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                'https://p1.ssl.qhimgs1.com/sdr/400__/t019b6f755a133b5f2b.jpg',
                'Aquaman',
                '\u0024 19.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p1.ssl.qhimgs1.com/sdr/400__/t01e409a20b6dbb2d67.jpg',
                'A Star Is Born',
                '\u0024 19.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p5.ssl.qhimgs1.com/sdr/400__/t01b0e8fa390bfd5d2f.jpg',
                'Instant Family',
                '\u0024 12.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p2.ssl.qhimgs1.com/sdr/400__/t0143ddcf04188e8358.jpg',
                'Ralph',
                '\u0024 14.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p0.ssl.qhimgs1.com/sdr/400__/t013076834486ed4896.jpg',
                'Bohemian',
                '\u0024 19.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p3.ssl.qhimgs1.com/sdr/400__/t014644203b3ea456ad.jpg',
                'Iron Man',
                '\u0024 14.99'),
          ],
        ));
  }

  Widget appsContainer() {
    return Container(
        height: 160.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            imageSection(
                'https://p5.ssl.qhimgs1.com/sdr/400__/t01083518e8f6ea1b75.jpg',
                'Avengers: Infinity War',
                '\u0024 13.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p3.ssl.qhimgs1.com/sdr/400__/t01958ae68111f06343.jpg',
                'Rampage',
                '\u0024 9.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p2.ssl.qhimgs1.com/sdr/400__/t01420c1b0b72d62aa2.jpg',
                'Fantastic Beasts',
                '\u0024 9.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p0.ssl.qhimgs1.com/sdr/400__/t01801b38f9568b07c0.jpg',
                'Ready Player One',
                '\u0024 13.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p0.ssl.qhimgs1.com/sdr/400__/t015adf1e49db5577d4.jpg',
                'Despicable Me 3',
                '\u0024 14.99'),
            SizedBox(
              width: 20.0,
            ),
            imageSection(
                'https://p5.ssl.qhimgs1.com/sdr/400__/t01f77fa9ec9da29a75.jpg',
                'Captain Marvel',
                '\u0024 14.99'),
          ],
        ));
  }
}
