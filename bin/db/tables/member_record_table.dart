import 'package:drift/drift.dart';

import 'member_table.dart';
import 'user_table.dart';

/// 会员余额消费记录
@DataClassName('MemberRecord')
class MemberRecords extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  IntColumn get memberId => integer().references(Members, #id)();

  RealColumn get expense => real()();

  RealColumn get preMoney => real()();

  RealColumn get afterMoney => real()();

  TextColumn get notes => text().nullable()();

  TextColumn get createTime => text()();
}
