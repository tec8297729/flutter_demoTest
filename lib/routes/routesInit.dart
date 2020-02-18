import '../pages/DemoBar/ExtendedNavBar/ExtendedNavBar.dart';
import '../pages/DemoBar/TabsNContext/TabsNContext.dart';
import '../pages/HomeBarTabs/HomeBarTabs.dart';
import '../pages/DemoOther/AccountPage/AccountPage.dart';
import '../pages/DemoPoup/CustomPoup/CustomPoup.dart';
import '../pages/DemoSliver/FixedAppBar/FixedAppBar.dart';
import '../pages/DemoSliver/FixedOneHeaderList/FixedOneHeaderList.dart';
import '../pages/TestMobx/TestMobx.dart';
import 'package:flutter/material.dart';
import 'routerName.dart';

// final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesInit = {
  // 页面路由定义...
  RouterName.home: (context, {params}) => HomeBarTabs(params: params),
  RouterName.extendedNavBar: (context, {params}) => ExtendedNavBar(),
  RouterName.tabsNContext: (context, {params}) => TabsNContext(),
  RouterName.fixedAppBar: (context, {params}) => FixedAppBar(),
  RouterName.accountPage: (context, {params}) => AccountPage(),
  RouterName.fixedOneHeaderList: (context, {params}) => FixedOneHeaderList(),
  RouterName.testMobx: (context, {params}) => TestMobx(params: params),
  RouterName.customPoup: (context, {params}) => CustomPoup(),
};
