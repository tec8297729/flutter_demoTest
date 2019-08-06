import 'package:mobx/mobx.dart';

// 以下这二段代码是必要的，后面输入命令生成文件所需要
part 'counter.g.dart';

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int value = 1;

  // 自定义方法，处理store中的值（根据业务来）
  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  // @action
  // void set(int value) {
  //   this.value = value;
  // }
}
