import 'package:flexible/model/counterStore/counterStore.dart';
import 'package:provider/provider.dart';
import '../model/themeStore/themeStore.dart'; // 主题颜色

List<SingleChildCloneableWidget> providersConfig = [
  ChangeNotifierProvider<ThemeStore>.value(value: ThemeStore()),
  Provider<CounterStore>.value(value: CounterStore()),
];
