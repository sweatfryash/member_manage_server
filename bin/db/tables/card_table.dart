import 'package:drift/drift.dart';

import 'member_table.dart';


/// 次卡表
@DataClassName('Card')
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get memberId => integer().references(Members, #id)();

  TextColumn get name => text()();

  IntColumn get used => integer()();

  IntColumn get total => integer()();

  TextColumn get createTime => text()();
}
