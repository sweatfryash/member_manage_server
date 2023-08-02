import 'package:drift/drift.dart';

/// 次卡消费记录
@DataClassName('CardRecord')
class CardRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  IntColumn get cardId => integer()();

  IntColumn get preTimes => integer()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}
