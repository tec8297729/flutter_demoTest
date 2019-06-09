import 'package:sqflite/sqflite.dart'; // 引入第三方 SQL写入数据库插件

class SqliteHelper {
  final sqlFileName = 'mydb.sql'; // 数据库名
  final tableSqlName = 'zzq_baseSql'; // 数据库表名
  Database db; // 暴露数据库变量，上面挂载了一系列操作数据库方法

  // 自定义打开数据库
  openDb() async {
    // 插件语法，获取location数据库，注意/后面直接写sql文件名
    String path = "${await getDatabasesPath()}/$sqlFileName";

    // 监测是否有数据库
    if (db == null) {
      // 插件语法 ，创建一个数据库(数据库名称,version版本号,回调-内带db对象和版本号)
      db = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // 创建完数据库后，会执行回调内语句...

        // 执行一段SQL语句
        /* 
          (创建一张zzq_baseSql的表)
          id 整数型，不可重复，以key为键
          userid 整数型， title和body字段都是文本型
         */
        await db.execute('''
          CREATE TABLE zzq_baseSql(
            id integer primary key,
            userId integer,
            title text,
            body text
          )
        ''');
      });
    }
  }

  // 自定义插入数据库方法(定义一个map类型的values字段，字符串并且是动态的-dynamic)
  insertDb(Map<String, dynamic> values) async {
    // 给数据库插入数据（数据库名称，插入的值）
    return db.insert(tableSqlName, values);
  }

  // 自定义查询数据库
  queryAllDb() async {
    // 查询数据库方法(数据库名称, 指定查询条件-null为全部)
    return await db.query(tableSqlName, columns: null);

    // 手动输入完整查询语句
    // db.rawQuery('SELECT * FROM "tableName"');

    // 条件查询数据库
    // db.query('tableName', columns: ['group'], where: '"group" = ?', whereArgs: ['my_group']);
  }

  // 删除数据库
  deleteDb(id) async {
    // 删除数据库中某条数据，指定ID
    return await db.delete(tableSqlName, where: 'id=$id');
  }
}
