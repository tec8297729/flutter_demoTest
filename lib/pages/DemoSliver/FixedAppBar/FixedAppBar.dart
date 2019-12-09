import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class FixedAppBar extends StatefulWidget {
  @override
  _FixedAppBarState createState() => _FixedAppBarState();
}

class _FixedAppBarState extends State<FixedAppBar> {
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  // 案例1
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length, // 指定tab长度
      child: Scaffold(
        body: NestedScrollView(
          // 返回头部bar组件数组
          headerSliverBuilder: _headerSliverBuilder,
          // 内容显示区域
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        leading: Icon(_selectedChoice.icon), // 标题左侧显示组件
        title: Text(_selectedChoice.title), // 标题内容

        // 右侧区域显示组件
        actions: <Widget>[
          IconButton(
            // action button
            icon: Icon(choices[0].icon),
            onPressed: () {
              _select(choices[0]);
            },
          ),
          IconButton(
            // action button
            icon: Icon(choices[1].icon),
            onPressed: () {
              _select(choices[1]);
            },
          ),
          PopupMenuButton<Choice>(
            onSelected: _select, // 下拉菜单item点击事件
            offset: Offset(0, 100),
            itemBuilder: (BuildContext context) {
              return choices.skip(2).map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice, // 每个元素上面保存的值，点击事件可以获取到
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],

        // 显示在 AppBar的标题和内容组件的底层，背景
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image(
            image: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551944816841&di=329f747e3f4c2554f24c609fd6f77c49&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160610%2F9-160610114520.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        // AppBar头部区域的底部栏显示组件
        bottom: TabBar(
          isScrollable: true, // 是否可以水平滚动
          labelColor: Colors.deepPurpleAccent,
          unselectedLabelColor: Colors.yellow,
          tabs: choices.map((Choice choice) {
            return Tab(
              text: choice.title,
              icon: Icon(
                choice.icon,
                color: Colors.yellow,
              ),
            );
          }).toList(),
        ),

        // 材料设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，
        // 当 SliverAppBar 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
        elevation: 1,

        backgroundColor: Colors.red, // APP bar的背景颜色
        brightness: Brightness.light, // App bar高亮主题
        textTheme: ThemeData().accentTextTheme, // App bar 上的文字主题

        expandedHeight: 200, // 展开高度
        pinned: true, // 是否固定在顶部
        floating: true, // 是否随着滑动隐藏标题
        // snap: true, // 与floating结合使用
      )
    ];
  }

  // 例子2
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: CustomScrollView(
  //       slivers: <Widget>[
  //         const SliverAppBar(
  //           pinned: true,
  //           expandedHeight: 250.0,
  //           flexibleSpace: FlexibleSpaceBar(
  //             title: Text('Demo'),
  //           ),
  //         ),
  //         SliverGrid(
  //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //             maxCrossAxisExtent: 200.0, // 每个元素的宽度
  //             mainAxisSpacing: 10.0, // 每个元素底部间隔
  //             crossAxisSpacing: 10.0, // 每个元素左右间隔大小
  //             childAspectRatio: 4.0, // // 按比例设置盒子大小（宽/高）
  //           ),
  //           // 生成显示的组件，返回索引值
  //           delegate: SliverChildBuilderDelegate(
  //             (BuildContext context, int index) {
  //               return Container(
  //                 alignment: Alignment.center,
  //                 color: Colors.teal[100 * (index % 9)],
  //                 child: Text('grid item $index'),
  //               );
  //             },
  //             childCount: 20, // 生成数量
  //           ),
  //         ),
  //         const SliverAppBar(
  //           pinned: true,
  //           expandedHeight: 180,
  //           backgroundColor: Colors.red,
  //           automaticallyImplyLeading: false,
  //           title: Text('Demo222'),
  //         ),
  //         // 无限向下创建新的元素，只要用户向下拉看新的区域范围
  //         SliverFixedExtentList(
  //           itemExtent: 50.0, // 每个元素占用的高度
  //           delegate: SliverChildBuilderDelegate(
  //             (BuildContext context, int index) {
  //               // 每次构造都会返回新的index索引
  //               return Container(
  //                 alignment: Alignment.center,
  //                 color: Colors.lightBlue[100 * (index % 9)],
  //                 child: Text('list item $index'),
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    Widget _itemBuilder(BuildContext context, int index) {
      return ListTile(
        leading: Icon(choice.icon),
        title: Text("this is a " + choice.title),
      );
    }

    return Card(
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }
}
