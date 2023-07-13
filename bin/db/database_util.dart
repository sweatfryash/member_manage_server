import 'package:sqlite3/sqlite3.dart';

/// 使用sqlite数据库
class DatabaseUtil {
  static final DatabaseUtil _instance = DatabaseUtil._internal();

  factory DatabaseUtil() => _instance;

  DatabaseUtil._internal();

  void init() {
    print('Using sqlite3 ${sqlite3.version}');
  }
}
