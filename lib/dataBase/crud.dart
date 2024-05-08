import 'package:crud_sql/dataBase/db.dart';
import 'package:sqflite/sqflite.dart';

abstract class Crud {
  final String table;

  Crud(this.table);

  Future<Database> get database async {
    return await Db().open();
  }

  query(String sql, {List<dynamic> arguments = const []}) async {
    Database db = await database;
    return db.rawQuery(sql, arguments);
  }

  update(Map<String, dynamic> data) async {
    Database db = await database;
    return db.update(table, data);
  }

  create(Map<String, dynamic> data) async {
    Database db = await database;
    return db.insert(table, data);
  }

  delete(int id) async {
    Database db = await database;
    return db.delete(table, where: "id = ?", whereArgs: [id]);
  }
}
