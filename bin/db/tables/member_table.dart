import 'package:drift/drift.dart';

/// 会员
@DataClassName('Member')
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get phone => text()();

  RealColumn get money => real()();

  IntColumn get discount => integer()();

  TextColumn get createTime => text()();
}
