import 'package:flutter/cupertino.dart';

class ListDataModel {
  /// 描述demo内容
  String text;

  /// 跳转路由名称
  String route;

  /// 按钮文字内容
  String btnText;

  /// 演示demo数据模型
  ListDataModel({@required this.btnText, @required this.route, this.text});
}
