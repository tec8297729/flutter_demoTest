import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_demo/src/models/counter/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:video_player/video_player.dart'; // 视频播放器组件
import 'CounterProvider.dart'; // 引入全局状态类（自定义）

class Page2 extends StatefulWidget {
  Page2({Key key}) : super(key: key);

  _Page2State createState() => _Page2State();
}

// 这是一个有状态组件，因为需要更新视图
class _Page2State extends State<Page2> with WidgetsBindingObserver {
  // 父组件定义一个变量值（动态值会变动）
  String dataTwo = "传递给组件2的值";
  int testCount = 0; // 初始值

  VideoPlayerController _videoPlayerController; // 创建一个视频变量
  int index = 0; // 接收bar当前点击索引
  // 创建一组list列表，里面多个组件，用于调用显示某一个组件
  List<Widget> Pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  // 右下角按钮点击事件
  playVideo(context) async {
    // 一系列方法介绍，根据业务绑定到指定按钮上使用
    print('播放');
    _videoPlayerController.play(); // 播放
    // _videoPlayerController.pause(); // 暂停功能
  }

  // 暂停播放
  stopVideo() {
    print('停止');
    _videoPlayerController.pause();
  }

  // 右下角按钮
  addBtn(context) async {
    print('播放右下角');
  }

  // 创建了一个改变store值的方法
  _increaseCount() {
    // 这里只做++，你可以根据业务写逻辑处理
    setState(() {
      testCount++;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

  @override
  void initState() {
    super.initState();
    // 读取网络视频地址（有方法读取本地视频）
    _videoPlayerController = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4');
    // 进入视频初始化，
    _videoPlayerController.initialize().then((_) {
      // 异步返回的才知道视频加载情况，并且更新视图
      setState(() {});
    });
  }

  // 给子组件调用父组件方法
  onChanged(value) {
    // 这里写业务逻辑
    print('供子组件调用$value');
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.black);
    // 放入创建好的store全局类，包裹你需要显示的组件
    return CounterProvider(
      count: testCount, // 传入初始值变量
      increaseCount: _increaseCount, // 处1理store的方法
      // 这里面放入你正常需要显示的组件
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bar标题'),
        ),
        // 设置底部tab标签，items内必须设置每个icon颜色及bar的title标题，否则报错
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // 只有设置fixed类型，底部bar才会显示所有的文字
          currentIndex: index, // 当前活动的bar索引
          // 点击了的时候把当前索引存起来
          onTap: (int idx) {
            setState(() {
              index = idx; // 更新视图
            });
          },
          items: [
            BottomNavigationBarItem(
              // 当切换到索引0的时候，此bar图片变成红色，否则是黑色
              icon: Icon(
                Icons.add,
                color: (index == 0 ? Colors.red : Colors.black),
              ),
              title: Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'account_circle',
                  style: textStyle,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                title: Text(
                  'close',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.build,
                  color: Colors.black,
                ),
                title: Text(
                  'build',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
        // 主体内容部份，根据bar切换内容也会变换
        // body: Pages[index],
        // 传递参数给子组件，并且可以自定义别名变量（这里定义为videoPlay）
        body: MyList(
          videoBox: _videoPlayerController,
          playVideoFn: () => playVideo(context),
          callback: (value) => onChanged(value),
          stopVideo: stopVideo,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => addBtn(context), // 点击按钮的事件
          tooltip: 'Increment',
          child: Icon(Icons.ac_unit), // 右下角按钮的图标
        ), //
      ),
    );
  }
}

// 这是子组件
class MyList extends StatefulWidget {
  // 接收父组件传递过来的方法callback
  MyList(
      {Key key,
      @required this.playVideoFn,
      this.callback,
      this.stopVideo,
      this.videoBox})
      : super(key: key);
  // 用变量保存传递过来的值或函数
  final playVideoFn;
  final videoBox;
  final callback;
  final stopVideo;
  _MyListState createState() => _MyListState();
}

// 独立抽离组件
class _MyListState extends State<MyList> {
  final Counter counter = Counter(); // 声明此类实例化
  var iconData = {
    'size': 20,
    'color': Colors.white,
  };

  @override
  Widget build(BuildContext context) {
    // 获取全局状态管理里面的count值
    final int count = CounterProvider.of(context).count;
    // 获取全局状态管理里面的 increaseCount方法
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;

    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        InkWell(
            // 每行item绑定点击事件
            onTap: () async {
              // widget.callback('666__bat子过来的');
              counter.increment(); // 加加
              // setState(() {}); // 更新视图
            },
            child: Text('全局通信store')),

        // 读取方式二：带有监听者模式，当数据更新的时候，自动更新视图
        Observer(
          builder: (_) => Text('${counter.value}'), // 读取mobx中的值
        ),

        // 进入判断是否有视频内容，显示不同组件
        // widget.playVideoFn.value.initialized
        //     ? AspectRatio(
        //         // 尝试使用的宽高比, 或直接固定参数如 1289/720
        //         aspectRatio: widget.playVideoFn.value.aspectRatio,
        //         child: VideoPlayer(widget.playVideoFn), // 显示的组件
        //       )
        //     : Text('没有视频'),

        AspectRatio(
          // 尝试使用的宽高比, 或直接固定参数如 1280/720
          aspectRatio: widget.videoBox.value.aspectRatio,
          child: Stack(
            children: <Widget>[
              // 进行堆叠组件, 先加入的最先在底层，依次排序层级
              VideoPlayer(widget.videoBox),
              // 定位组件
              Positioned(
                bottom: 0,
                child: Row(
                  // 里面显示你需要的组件，已经定位在底部显示
                  children: <Widget>[
                    GestureDetector(
                      // 显示的组件
                      child: Icon(
                        Icons.play_arrow,
                        size: 20,
                        color: Colors.white,
                        // iconData,
                      ),
                      // 组件的点击事件(相关移动端事件都可以)
                      onTap: () {
                        increaseCount();
                        setState(() {
                          // widget.playVideoFn();
                        });
                      },
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.pause,
                        size: 20,
                        color: Colors.white,
                      ),
                      // 组件的点击事件(相关移动端事件都可以)
                      onTap: () {
                        setState(() {
                          widget.stopVideo();
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        // Container(
        //   width: 180.0,
        //   color: Colors.amber,
        // ),
        // Container(
        //   width: 180.0,
        //   color: Colors.deepOrange,
        // ),
        // Container(
        //   width: 180.0,
        //   color: Colors.deepPurpleAccent,
        // ),
      ],
    );
  }
}
