import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = new TextEditingController();
  final FocusNode _focusNode = FocusNode(); // 光标取焦控制器
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(focusListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  focusListener() {
    setState(() {
      isFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        titleWidget(context),
        rightW(context),
      ],
    );
  }

  /// 标题内容
  Widget titleWidget(BuildContext context) {
    return Container(
      // alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        focusNode: _focusNode, // 控制输入框焦点
        controller: controller, // 获取此组件的对象（控制正在编辑的文本）
        autofocus: true, // 自动聚焦光标
        textInputAction: TextInputAction.search,
        cursorRadius: Radius.circular(5.0), // 光标圆角弧度
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10, right: 10),
        ),
        style: TextStyle(
          fontSize: 22,
          color: Theme.of(context).primaryIconTheme.color,
        ),
      ),
    );
  }

  /// 右侧组件
  Widget rightW(BuildContext context) {
    return Positioned(
      right: 14.0,
      child: Theme(
        data: Theme.of(context).copyWith(
          buttonTheme: ButtonThemeData(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            minWidth: 60.0,
          ),
        ),
        child: Row(
          children: <Widget>[
            if (isFocus)
              IconButton(
                icon: Icon(Icons.close),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  controller.clear();
                },
              ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// 默认右侧组件
  Widget defaultRightW() {
    return Container(
      child: Row(
        children: <Widget>[
          if (isFocus)
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                controller.clear();
              },
            ),
          Text('data'),
        ],
      ),
    );
  }
}
