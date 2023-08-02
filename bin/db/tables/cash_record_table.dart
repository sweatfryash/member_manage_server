import 'package:drift/drift.dart';

/// 非会员现金消费记录
@DataClassName('CashRecord')
class CashRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  RealColumn get expense => real()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}

