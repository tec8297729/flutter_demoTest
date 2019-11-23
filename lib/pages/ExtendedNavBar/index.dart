//import,part,library指令可以帮助创建一个模块化的，可共享的代码库。库不仅提供了API，
// 还提供隐私单元：以下划线（_）开头的标识符只对内部库可见。每个Dartapp就是一个库，即使它不使用库指令。
library navbar_scaffold; //声明库

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

//添加实现文件，把part fileUri放在有库的文件，其中fileURI是实现文件的路径。然后在实现文件中，添加部分标识符
part 'scaffoldlib/ConstantMethods.dart';
part 'scaffoldlib/ease_in_widget.dart';
part 'scaffoldlib/ExtendedNavigationBarScaffold.dart';
part 'scaffoldlib/page_transformer.dart';
part 'scaffoldlib/ParallexCardWidet.dart';
