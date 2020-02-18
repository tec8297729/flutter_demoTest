import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'routes/onGenerateRoute.dart';
import 'config/providers_config.dart'; // providers配置文件
import 'model/themeStore/themeStore.dart'; // 全局主题

void main() {
  runApp(MultiProvider(
    providers: providersConfig,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeStore>(
      builder: (context, themeStore, child) => MaterialApp(
        locale: Locale('zh', 'CH'),

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CH'),
          const Locale('en', 'US'), // English
        ],
        theme: themeStore.getTheme,
        // initialRoute: initialRoute,
        // 全局统一获取路由传递的参数
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
