import 'package:drift/drift.dart';

/// 会员余额消费记录
@DataClassName('MemberRecord')
class MemberRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer()();

  IntColumn get memberId => integer()();

  RealColumn get expense => real()();

  RealColumn get preMoney => real()();

  RealColumn get afterMoney => real()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}
