import 'package:drift/drift.dart';

import '../database.dart';

@DataClassName('AppOption')
class AppOptions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get value => text()();

  TextColumn get type => text()();

  TextColumn get createTime => text()();
}

class OptionQuery {
  /// 新增
  static Future<void> addOption(
    String name,
    String type, {
    String? value,
  }) async {
    await MyDatabase().into(MyDatabase().appOptions).insert(
          AppOptionsCompanion(
            name: Value<String>(name),
            type: Value<String>(type),
            value: Value<String>(value ?? ''),
            createTime: Value<String>(DateTime.now().toString()),
          ),
        );
  }

  /// 查询
  static Future<List<AppOption>> queryOption({String? type}) async {
    if (type == null) {
      return await MyDatabase().select(MyDatabase().appOptions).get();
    }
    final query = MyDatabase().select(MyDatabase().appOptions)
      ..where((option) => option.type.equals(type));
    return query.get();
  }
}
