import 'package:flexible/model/ListDataModel/listData_m.dart';
import 'package:flexible/routes/routeName.dart';
import 'package:flutter/material.dart';

class HomeStore with ChangeNotifier {
  /// 首页demo列表数据
  List<ListDataModel> homeListData = [
    ListDataModel(btnText: '底部栏带动画效果', route: RouteName.extendedNavBar),
    ListDataModel(
      text: '从顶部tabs切换开始，每个页面内在内置嵌套多个tabs，每个tabs都是自定义显示内容区域',
      btnText: 'tabs嵌套多层级',
      route: RouteName.tabsNContext,
    ),
    ListDataModel(
      text: '默认顶部显示tabBar后，当滚动视图区域时，可滚动置顶AppBar组件，并且可支持多个。',
      btnText: '滚动置顶组件',
      route: RouteName.fixedAppBar,
    ),
    ListDataModel(
      text: '自定义下拉菜单组件，可以放任意自由的组件',
      btnText: '下拉菜单按钮',
      route: RouteName.customPoup,
    ),
    ListDataModel(
      text: '',
      btnText: 'step步进器',
      route: RouteName.accountPage,
    ),
  ];
}
