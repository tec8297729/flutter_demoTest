import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  List<Step> steps = [
    Step(
      title: Text('account'),
      isActive: false, // 是否选中
      // 步进器状态图标， complete完成、error错误、editing编辑、disabled禁用（显示索引）、indexed显示索引
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          Text('具体操作显示的组件'),
        ],
      ),
    ),
    Step(
      title: Text('new2'),
      subtitle: Text('副标题内容'),
      isActive: false, // 是否选中
      state: StepState.error, // 当前步进器状态
      content: Column(
        children: <Widget>[
          Text('具体操作new2'),
        ],
      ),
    ),
    Step(
      title: Text('disabled'),
      isActive: true, // 是否选中
      state: StepState.disabled, // 当前步进器状态
      content: Column(
        children: <Widget>[
          Text('具体操作disabled'),
        ],
      ),
    ),
  ];

  next() {
    if (currentStep + 1 != steps.length) {
      goTo(currentStep + 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  switchStepType() {
    setState(() {
      if (stepperType == StepperType.horizontal) {
        stepperType = StepperType.vertical;
      } else {
        stepperType = StepperType.horizontal;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('步进器组件'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps, // 数组存放多个step步进器组件，用于显示
              currentStep: currentStep, // 当前步进器索引，控制显示第几个步骤
              type: stepperType, // 步进器排列方式，默认垂直方向
              // 确认按钮事件
              onStepContinue: () {
                print('onStepContinue');
                next();
              },
              // 取消按钮事件
              onStepCancel: () {
                print('onStepCancel');
                cancel();
              },
              // 点击步进器图标及文字事件
              onStepTapped: (stepIndex) {
                // 返回当前点击的步进器索引
                print('onStepTapped$stepIndex');
                goTo(stepIndex);
              },
              // 用于创建自定义控件的回调
              controlsBuilder: (context, {onStepContinue, onStepCancel}) {
                return Row(
                  children: <Widget>[
                    // 自定义onStepContinue事件按钮样式
                    FlatButton(
                      onPressed: onStepContinue,
                      child: const Text('确认'),
                    ),
                    // 自定义onStepCancel事件按钮样式
                    FlatButton(
                      onPressed: onStepCancel,
                      child: const Text('取消'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switchStepType();
        },
      ),
    );
  }
}
