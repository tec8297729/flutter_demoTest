import 'dart:io';
import 'package:flutter/cupertino.dart'; // IOS的风格
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // 引入第三方组件
import 'dart:convert'; // 用于JSON序列化
import 'SqfliteHelper.dart'; // 封装的SQL方法
import 'package:flutter_demo/MyHomePage/Page3.dart'; // 绝对路径导入，从项目根目录起
import 'RoutsAnimation.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  // 接收外部传入的参数，如title,外部分可以传入这变量参数
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; // 把title保存起来变量，供组件使用
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final sqlHelp = SqliteHelper(); // 实例化class组件
  bool goFlag = false;

  // 初始化state值，在实例化的时候
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('initState');
  }

  // 当依赖的InheritedWidget 更新state值时,会触发此生命周期
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  // 如果想要知道App的生命周期,那么需要通过WidgetsBindingObserver的didChangeAppLifecycleState 来获取
  // 通过此生命周期获取APP中的一些其它生命周期
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
    /* 
      resumed	可见并能响应用户的输入
      inactive	处在并不活动状态，无法处理用户响应
      paused	不可见并不能响应用户的输入，但是在后台继续活动中
     */
    if (state == AppLifecycleState.resumed) {
      print('可见并能响应用户的输入');
    }
  }


  @override
  void didUpdateWidget(oldWidget) {
    // 当组件状态改变时触发
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void reassemble() {
    // 在热重载(hot reload)时会被调用
    super.reassemble();
    print('reassemble');
  }

  // 在组件被卸载之前触发（当前组件还可渲染读取）
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  // 组件被卸载时触发
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
    print('dispose');
  }

  // 预加载布局
  Widget _loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
        Container(
          child: Text("正在加载"),
          margin: EdgeInsets.only(top: 10.0),
        )
      ],
    );
  }

  // 组件默认调用事件，获取数据库的内容
  getAllPost() async {
    await sqlHelp.openDb();
    return await sqlHelp.queryAllDb();
  }

  // 右下角按钮点击事件
  sqlAction() async {
    // var url = 'https://img.yihaodianimg.com/front-homepage/global/images/logo/logo_new@2x.png'
    // // 从网络url地址中获取一张图片，返回图片对象地址
    // var file = await DefaultCacheManager().getSingleFile(url);
    // // 读取网络图片地址， 并且下载到本地cache缓存中
    // DefaultCacheManager().getFile(url);
    // // 下载一张网络图片地址
    // DefaultCacheManager().downloadFile(url);
    // // 直接从网络读取图片，缓存下来的是只是url链接地址
    // DefaultCacheManager().getFileFromCache(url);
    // // 不管图片是从何处来，可以自定义插入到缓存中去
    // DefaultCacheManager().putFile(url, fileBytes);
    // DefaultCacheManager().removeFile(url); // 移除指定一条缓存图片
    // DefaultCacheManager().emptyCache(); // 清空所有缓存数据

    // final String host = 'https://jsonplaceholder.typicode.com/posts';
    // var res = await http.get(host); // get请求链接
    // List resList = jsonDecode(res.body); // 把请求后的数据进行序列化（转成list数组）
    // print(resList);
    // // 打开数据库
    // await sqlHelp.openDb();
    // // 循环每个数据，插入到数据库当中去
    // resList.forEach((item) async => await sqlHelp.insertDb(item));

    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     // 构建跳转页面后显示的组件
    //     builder: (context) {
    //       // 跳转到某个组件中去，传递textData变量过去，内容aaabbb
    //       return Page3(textData: 'aaabbb');
    //     },
    //   ),
    // );
    // 跳转到指定路由页面，并且删除历史页面记录（不可用回退操作）
    // Navigator.popUntil(context, (Route<dynamic> route) => goFlag);
    // 在你需要跳转路由的按钮绑定跳转事件
    // Navigator.of(context).push(
    //   // 跳转路由，直接使用封装的组件，传入你要跳转后显示的组件
    //   RoutsAnimation(Page3(textData: 'aaabbb')),
    // );
    // ModalRoute.of(context).settings; // 获取路由上面属性（路由名称，参数）
    // ModalRoute.of(context).settings.arguments; // 获取路由参数

    // fetch();
  }

  void fetch() async {
    Response response;
    Dio dio = new Dio(); // 实例化请求，可以传入options参数

    String dir = (await getApplicationDocumentsDirectory()).path; // 获取路径
    var filePath = "$dir/xx.txt"; // 文件地址，加上存放前缀（这是动态的根据机型）

    // 发起多个并发请求:
    // var res = await Future.wait([dio.post("/info"), dio.get("/token")]);
    File fileReal = new File(filePath);
    // 判断文件是否存在
    if (!fileReal.existsSync()) {
      fileReal.createSync(); // 不存在时，创建文件
    }

    // 下载文件（dio插件请求）
    response = await dio.get(
      "https://www.baidu.com", // 访问下载地址
      // "$dir/xx.txt", // 保存文件路径
      options: Options(
        // 配置下载参数
        responseType: ResponseType.bytes, //设置接收类型为bytes(二进制)
      ),
    );

    print(response.data); //二进制数组

    // 一次性的读取整个文本内容
    // var contents = await fileReal.readAsString();

    // print(response.data); // 获取到请求的内容

    // print('${contents}，contents内容'); // 输出 当前打开的文件内所有内容

    // 以流的方式接收响应数据：
    // Response<ResponseBody> rs = await Dio().get<ResponseBody>(
    //   "https://github.com/flutterchina/dio/blob/master/README-ZH.md",
    //   options: Options(responseType: ResponseType.stream), //设置接收类型为stream
    // );
    // // rs.data.stream.
    // print(rs.data.stream);

    // Response<List<int>> rs = await Dio().get<List<int>>(
    //   url,
    //   options: Options(responseType: ResponseType.bytes), //设置接收类型为bytes
    // );
    // print(rs.data); //二进制数组
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // 可以显示父组件的标题
      ),
      body: Container(
        child: InkWell(
          child: Text('data测试'),
          onTap: () {
            setState(() {
              goFlag = true;
            });
          },
        ),
      ),
      // body: FutureBuilder(
      //   future: getAllPost(), // 获取数据库内容
      //   // 返回值为显示内容, snap为请求后的res
      //   builder: (context, snap) {
      //     // 判断没有数据时，snap参数是组件请求后的内容
      //     if (!snap.hasData) {
      //       return Container(
      //         child: InkWell(
      //           child: Text('data测试'),
      //           onTap: () {
      //             setState(() {
      //               goFlag = true;
      //             });
      //           },
      //         ),
      //       ); // 当没有内容时，返回一个空内容
      //     }

      //     List datas = snap.data; // 数据库中获取的数据

      //     // 返回显示一个list列表
      //     return ListView.builder(
      //       itemCount: datas.length, // 列表长度
      //       // 每个列表渲染的内容
      //       itemBuilder: (context, idx) {
      //         var data = datas[idx]; // 把当前数据读取出来
      //         // 渲染到这个页面上（包裹inkWell组件，添加其它事件用）
      //         return InkWell(
      //           // 每行item绑定点击事件
      //           onTap: () async {
      //             // 删除数据库中，当前行, 传入当前数据的id
      //             await sqlHelp.deleteDb(datas[idx]['id']);
      //             setState(() {}); // 更新视图
      //           },
      //           // 显示的内容
      //           child: ListTile(
      //             title: Text(data['title']), // 主标题
      //             subtitle: Text(data['body']), // 副标题
      //             trailing: Icon(Icons.home), // 右侧图标（后缀处）
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: sqlAction, // 点击按钮的事件
        tooltip: 'Increment',
        child: Icon(Icons.http), // 右下角按钮的图标
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
