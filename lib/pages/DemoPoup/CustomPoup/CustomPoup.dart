import 'package:flutter/material.dart';

import 'PopupWinMenuButton/PopupWinMenuButton.dart';

const _textColor = Color(0xFF58A1BB);

class CustomPoup extends StatefulWidget {
  @override
  _CustomPoupState createState() => _CustomPoupState();
}

class _CustomPoupState extends State<CustomPoup> {
  GlobalKey topTitleKey = GlobalKey();
  double topHeight; // 顶部距离
  int compreSortItemIndex; // 1、综合排序  2、距离  3销量  4筛选
  IconData compreSortIcon = Icons.keyboard_arrow_down;
  List compreSortDataList = [
    {
      'title': '综合排序',
      'isSelect': false,
    },
    {
      'title': '好评优先',
      'isSelect': false,
    },
    {
      'title': '起送价最低',
      'isSelect': false,
    },
    {
      'title': '配送最快',
      'isSelect': false,
    },
  ];
  String compreSortSelectTitle;

  @override
  void initState() {
    super.initState();
  }

  /// 当前标题点击高亮 1、综合排序  2、距离  3销量  4筛选
  handleSelectIndex(int index) {
    setState(() {
      compreSortItemIndex = compreSortItemIndex == index ? 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 案例1:只调用方法弹出下拉框
          Container(
            width: double.infinity,
            height: 100,
            child: Center(child: headerCompreSortBtn()),
          ),

          // 案例2: 带按钮版本的下拉菜单
          PopupWinMenuButton(
            itemBuilder: (context) {
              return [
                for (var i = 0; i < compreSortDataList.length; i++)
                  compreSortItem(i),
              ];
            },
            child: Text(
              '内置下拉菜单的按钮',
              style: TextStyle(fontSize: 22),
            ),
            onTap: (context) {},
            offset: Offset(0, 100),
          ),
        ],
      ),
    );
  }

  /// 综合排序按钮
  Widget headerCompreSortBtn() {
    return GestureDetector(
      // 标题名称,默认显示 综合排序
      child: titleBtnWidget(
        compreSortSelectTitle ?? compreSortDataList[0]['title'],
        index: 1, // top系列整体索引,非当前数组索引
        icon: compreSortIcon,
      ),
      onTap: () {
        // 更新icon图标及选中状态
        compreSortIcon = Icons.keyboard_arrow_up;
        handleSelectIndex(1);
        // 显示下拉菜单
        showWinMenu(
          context: context,
          position: RelativeRect.fromLTRB(0, 152, 0, 0), // 显示位置
          elevation: 0,
          items: [
            for (var i = 0; i < compreSortDataList.length; i++)
              compreSortItem(i),
          ],
        );
      },
      onTapCancel: () {
        compreSortIcon = Icons.keyboard_arrow_down;
        handleSelectIndex(compreSortItemIndex);
      },
    );
  }

  /// 综合排序item子组件
  Widget compreSortItem(int index) {
    bool _isSelect = compreSortDataList[index]['isSelect'];
    return GestureDetector(
      onTap: () {
        for (var i = 0; i < compreSortDataList.length; i++) {
          compreSortDataList[i]['isSelect'] = false;
          if (i == index) {
            compreSortDataList[i]['isSelect'] = true;
          }
        }
        setState(() {
          compreSortSelectTitle = compreSortDataList[index]['title']; // 更换标题
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 15, top: 10, bottom: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              compreSortDataList[index]['title'] ?? '',
              style: TextStyle(
                fontSize: 16,
                color: _isSelect ? _textColor : Colors.black,
              ),
            ),
            if (_isSelect)
              Icon(
                Icons.check,
                size: 16,
                color: _textColor,
              ),
          ],
        ),
      ),
    );
  }

  /// iocn标题组件
  /// [index] 点击类型 1、综合排序  2、距离  3销量  4筛选
  Widget titleBtnWidget(String text,
      {int index = 1, IconData icon, bool left = false}) {
    Color _color = compreSortItemIndex == index ? _textColor : Colors.black;
    TextStyle _textStyle = TextStyle(
      fontSize: 26,
      color: _color,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text, style: _textStyle),
        if (icon != null)
          Icon(
            icon,
            color: _color,
          ),
      ],
    );
  }
}
