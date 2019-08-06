import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Page3 extends StatelessWidget {
  // 接收外部组件传入的参数textData
  Page3({Key key, @required this.textData}) : super(key: key);
  final String textData; // 变量保存，final初始化变量类型声明，只可以设置一次

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page3页面'),
      ),
      body: Center(
        child: Container(
          height: 200.0,
          child: MyList(),
        ),
      ),
      // body: StreamBuilder(
      //   stream: _imageStream, // 接收一个stream流出口对象
      //   builder: (context, snap) {
      //     // 判断是否有返回资料数据
      //     if (!snap.hasData) return Container(); // 没有数据返回空
      //     List<Asset> datas = snap.data;
      //     return ListView.builder(
      //       itemCount: datas.length,
      //       itemBuilder: (context, index) {},
      //     );
      //   },
      // ),
      // 右下角按钮，演示测试发送数据给上一页面
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        // 点击按钮的事件
        onPressed: () {
          // 回退上级页面，传递参数过去
          Navigator.pop(context, false);
          // Navigator.removeRoute(context, '/page3');
          // Navigator.replace(context, oldRoute: Route(), newRoute: '/page2');
          // 返回指定的 上一级路由页面
          // Navigator.popAndPushNamed(context, '/page2');
          // getImgs();
        },
      ),
    );
  }

  getImgs() async {
    await MultiImagePicker.pickImages(maxImages: 1);
    // List<Asset> resultList;
    // String error;

    // try {
    //   resultList = await MultiImagePicker.pickImages(
    //     maxImages: 3,
    //   );
    //   print('读取图片${resultList}');
    // } on PlatformException catch (e) {
    //   error = e.message;
    //   print('非法错误${error}');
    // }
  }
}

// 独立抽离组件
class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180.0,
          color: Colors.lightBlue,
        ),
        Container(
          width: 180.0,
          color: Colors.amber,
        ),
        Container(
          width: 180.0,
          color: Colors.deepOrange,
        ),
        Container(
          width: 180.0,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}
