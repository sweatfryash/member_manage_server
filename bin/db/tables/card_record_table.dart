import 'package:drift/drift.dart';

import 'card_table.dart';
import 'user_table.dart';

/// 次卡消费记录
@DataClassName('CardRecord')
class CardRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  IntColumn get cardId => integer().references(Cards, #id)();

  IntColumn get preTimes => integer()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}
