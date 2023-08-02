import 'package:drift/drift.dart';

/// 次卡表
@DataClassName('Card')
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get memberId => integer()();

  IntColumn get used => integer()();

  IntColumn get total => integer()();

  TextColumn get typeId => text()();

  TextColumn get createTime => text()();
}
