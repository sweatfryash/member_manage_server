import 'package:drift/drift.dart';

import '../database.dart';

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get username => text()();

  TextColumn get password => text()();

  TextColumn get phone => text().nullable()();
}

class UserQuery {
  /// 登录
  static Future<User?> queryUser(String username, String password) {
    final query = MyDatabase().select(MyDatabase().users)
      ..where((user) => user.username.equals(username))
      ..where((user) => user.password.equals(password));
    return query.getSingleOrNull();
  }
}