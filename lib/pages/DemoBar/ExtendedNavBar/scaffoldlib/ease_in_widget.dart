part of navbar_scaffold;

//StatefulWidget又被称为有状态组件，开发者可以根据用户的操作来选择性的更新界面上的组件。
class EaseInWidget extends StatefulWidget {
  final Widget child;
  final Function onTap;
  const EaseInWidget({Key key, @required this.child, @required this.onTap})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _EaseInWidgetState();
}

//关键字 with 就是dart当中到 mixin，你需要使用with关键字，后跟一个或多个mixin的名
//mixin 的中文意思是混入，就是在类中混入其他功能。
//复用代码,mixin 最早的根源来自于Lisp
//在面向对象的语言中,mixin 类是一个可以把自己的方法提供给其他类使用，但却不需要成为其他类的父类。
//mixin 是要通过非继承的方式来复用类中的代码。
class _EaseInWidgetState extends State<EaseInWidget>
    with TickerProviderStateMixin<EaseInWidget> {
  AnimationController controller;
  Animation<double> easeInAnimation;

  @override
  void initState() {
    super.initState();

    //动画到实现
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 200,
        ),
        value: 1.0);
    easeInAnimation = Tween(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    //Flutter中用于处理手势
    // onTap: () //点击
    // onDoubleTap: () //双击
    //onLongPress: () //长按
    return GestureDetector(
      ////点击
      onTap: () {
        controller.forward().then((val) {
          controller.reverse().then((val) {
            widget.onTap();
          });
        });
      },
      //动画，变换后的小部件的比例动画化
      child: ScaleTransition(
        scale: easeInAnimation,
        child: widget.child,
      ),
    );
  }

  //flutter生命周期方法
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
