import 'package:flexible/pages/HomeBarTabs/Search/components/MyAppBar/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 自定义AppBar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    this.backgroundColor,
    this.title: '',
    this.actionName: '',
    this.onPressed,
    this.elevation: 4,
    this.backTips,
    this.textStyle,
  });

  /// 背景颜色
  final Color backgroundColor;

  /// 标题
  final String title;

  /// 标题文字样式
  final TextStyle textStyle;

  /// 右侧标题内容
  final String actionName;

  /// 右侧点击事件
  final VoidCallback onPressed;

  /// 长按提示内容
  final String backTips;

  /// 阴影
  final double elevation;

  // 整体AppBar高度
  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (backgroundColor == null) {
      _backgroundColor = Theme.of(context).primaryColor;
    } else {
      _backgroundColor = backgroundColor;
    }

    // 判断主题色变更
    SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    return Semantics(
      label: '自定义AppBar组件',
      namesRoute: true,
      header: true,
      // 修改状态栏颜色
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: Material(
          color: _backgroundColor,
          elevation: elevation,
          child: SafeArea(
            child: SearchBar(),
          ),
        ),
      ),
    );
  }
}
