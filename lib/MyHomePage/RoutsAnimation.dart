import 'package:flutter/cupertino.dart';

// 定义一个带跳转动画效果的路由组件
class RoutsAnimation extends PageRouteBuilder {
  RoutsAnimation(this.widgetDemo)
      : super(
          // 定义路由参数，因为是继承的组件
          transitionDuration: Duration(seconds: 1), // 持续1秒
          // 页面显示的组件
          pageBuilder: (
            BuildContext context,
            Animation<double> animation1, // 必要的动画二个参数
            Animation<double> animation2,
          ) {
            return widgetDemo; // 返回你要显示的组件（外部传入）
          },
          // 过渡效果
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation1, // 必要的动画参数
            Animation<double> animation2,
            Widget child, // 显示动画组件
          ) {
            // 缩放的动画效果
            return ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn, // 曲线，快出慢进
              )),
              child: child,
            );
          },
        );
  final widgetDemo;
}
