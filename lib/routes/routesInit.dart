import 'package:flexible/pages/DemoBar/ExtendedNavBar/ExtendedNavBar.dart';
import 'package:flexible/pages/DemoBar/TabsNContext/TabsNContext.dart';
import 'package:flexible/pages/BarTabs/BarTabs.dart';
import 'package:flexible/pages/DemoSliver/FixedAppBar/FixedAppBar.dart';
import 'package:flexible/pages/TestMobx/TestMobx.dart';
import 'package:flutter/material.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesInit = {
  // 页面路由定义...
  '/': (BuildContext context, {params}) => BarTabs(params: params),
  '/extendedNavBar': (BuildContext context, {params}) => ExtendedNavBar(),
  '/tabsNContext': (BuildContext context, {params}) => TabsNContext(),
  '/fixedAppBar': (BuildContext context, {params}) => FixedAppBar(),
  '/testMobx': (BuildContext context, {params}) => TestMobx(params: params),
};
