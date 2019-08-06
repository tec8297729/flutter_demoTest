import 'package:mobx/mobx.dart';

// 以下这二段代码是必要的，后面输入命令生成文件所需要
part 'cat_facts.g.dart';

class CatStore = CatFacts with _$CatStore;

abstract class CatFacts with Store {
  @observable
  int dataBB = 22;

  // 自定义方法，处理store中的值（根据业务来）
  @action
  void increment() {
    dataBB++;
  }

  @action
  void decrement() {
    dataBB--;
  }

  // @action
  // void set(int value) {
  //   this.value = value;
  // }
}
