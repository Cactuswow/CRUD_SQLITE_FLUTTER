import 'package:crud_sql/dataBase/tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static const String _name = "KactuswowApp";
  static const int _version = 1;

  void configureDatabase(Database dataBase) async {
    dataBase.execute("PRAGMA foreign_keys = ON");
  }

  void onCreateDatabase(Database database, int version) async {
    for (final script in tables) {
      await database.execute(script);
    }
  }

  Future<Database> open() async {
    String path = join(await getDatabasesPath(), Db._name);

    return openDatabase(
      path,
      version: Db._version,
      onConfigure: configureDatabase,
      onCreate: onCreateDatabase,
    );
  }
}
