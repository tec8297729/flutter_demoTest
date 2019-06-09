import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // 引入第三方组件
import 'dart:convert'; // 用于JSON序列化
import 'SqfliteHelper.dart'; // 封装的SQL方法

class MyHomePage extends StatefulWidget {
  // 接收外部传入的参数，如title,外部分可以传入这变量参数
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title; // 把title保存起来变量，供组件使用
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sqlHelp = SqliteHelper(); // 实例化class组件

  // 组件默认调用事件，获取数据库的内容
  getAllPost() async{
    await sqlHelp.openDb();
    return await sqlHelp.queryAllDb();
  }

  // 右下角按钮点击事件
  sqlAction() async{
    final String host = 'https://jsonplaceholder.typicode.com/posts';
    var res = await http.get(host); // get请求链接
    List resList = jsonDecode(res.body); // 把请求后的数据进行序列化（转成list数组）
    print(resList);
    // 打开数据库
    await sqlHelp.openDb();
    // 循环每个数据，插入到数据库当中去
    resList.forEach((item) async => await sqlHelp.insertDb(item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // 可以显示父组件的标题
      ),
      body: FutureBuilder(
        future: getAllPost(), // 获取数据库内容
        // 返回值为显示内容, snap为请求后的res
        builder: (context, snap){
          // 判断没有数据时，snap参数是组件请求后的内容
          if(!snap.hasData){
            return Container(); // 当没有内容时，返回一个空内容
          }

          List datas = snap.data; // 数据库中获取的数据

          // 返回显示一个list列表
          return ListView.builder(
            itemCount: datas.length, // 列表长度
            // 每个列表渲染的内容
            itemBuilder: (context, idx){
              var data = datas[idx]; // 把当前数据读取出来
              // 渲染到这个页面上（包裹inkWell组件，添加其它事件用）
              return InkWell(
                // 每行item绑定点击事件
                onTap: () async{
                  // 删除数据库中，当前行, 传入当前数据的id
                  await sqlHelp.deleteDb(datas[idx]['id']); 
                  setState(() {}); // 更新视图
                },
                // 显示的内容
                child: ListTile(
                  title: Text(data['title']), // 主标题
                  subtitle: Text(data['body']), // 副标题
                  trailing: Icon(Icons.home), // 右侧图标（后缀处）
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sqlAction, // 点击按钮的事件
        tooltip: 'Increment',
        child: Icon(Icons.http), // 右下角按钮的图标
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
