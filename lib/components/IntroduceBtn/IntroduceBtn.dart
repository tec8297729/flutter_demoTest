import 'package:flutter/material.dart';

/// [btnText] 按钮文字
///
/// [text] 介绍文字
///
/// [routerName] 跳转路由页面-别名
class IntroduceBtn extends StatelessWidget {
  IntroduceBtn({
    Key key,
    this.text,
    @required this.btnText,
    @required this.routeName,
  });
  final String btnText;
  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (text != null)
          Container(
            // alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10, top: 5),
          child: RaisedButton(
            child: Text(
              btnText,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
          ),
        ),
        // Divider(
        //   height: 10,
        //   color: Colors.red,
        // ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
