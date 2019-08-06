import 'package:flutter/widgets.dart';

// 创建一个全局的状态类
class CounterProvider extends InheritedWidget {
  // 创建InheritedWidget内的值必须是final类型，只能初始赋值
  final int count; // 管理的store值（可创建多个）
  final VoidCallback increaseCount; // 定义的方法
  final Widget child; // 子组件继承

  CounterProvider({
    this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  // 创建静态方法 of来暴露此类下面的所有属性变量和函数
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // 是否重建这个widget组件，根据判断业务逻辑来处理,每次更新值都会触发
    return true; // 此时不需要重建组件
  }
}
