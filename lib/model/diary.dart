import 'package:crud_sql/dataBase/crud.dart';
import 'package:crud_sql/dataBase/tables.dart';

class Diary extends Crud {
  Diary(
    this.id,
    this.type,
    this.enterCode,
  ) : super(diaryTable);

  final int id;
  final String type;
  final String enterCode;
}
