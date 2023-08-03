import 'package:drift/drift.dart';

import 'user_table.dart';

/// 非会员现金消费记录
@DataClassName('CashRecord')
class CashRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  RealColumn get expense => real()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}

