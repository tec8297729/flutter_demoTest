import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/HomeBarTabs/Home/provider/homeStore.p.dart';
import 'pages/HomeBarTabs/Search/provider/searchStore.p.dart';
import 'pages/HomeBarTabs/provider/homeBarTabsStore.p.dart';
import 'provider/themeStore.p.dart';

List<SingleChildWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()), // 主题颜色
  ChangeNotifierProvider<HomeBarTabsStore>.value(value: HomeBarTabsStore()),
  ChangeNotifierProvider<HomeStore>.value(value: HomeStore()),
  ChangeNotifierProvider<SearchStore>.value(value: SearchStore()),
];
