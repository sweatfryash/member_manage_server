import 'package:drift/drift.dart';

import '../database.dart';

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