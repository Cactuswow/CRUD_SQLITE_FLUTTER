const String diaryTable = "diary";
const String pageTable = "page";

List get tables => [
      _createTable(
        diaryTable,
        "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "type TEXT,"
        "enterCode TEXT",
      ),
      _createTable(
        pageTable,
        "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
        "date TEXT,"
        "title TEXT,"
        "content TEXT,"
        "diaryId INTEGER,"
        "FOREIGN KEY(diaryId) REFERENCES $diaryTable (id)",
      )
    ];

String _createTable(String table, String columns) {
  return "CREATE TABLE IF NOT EXIST $table ($columns)";
}
