//part of加库名 表示该文件属于那个库
part of navbar_scaffold;

TextStyle ktitleStyle = TextStyle(fontWeight: FontWeight.w800);
TextStyle ksubtitleStyle = TextStyle(fontWeight: FontWeight.w600);

//半圆角的矩形边框
ShapeBorder kAppbarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
);
