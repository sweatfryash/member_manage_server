import 'package:drift/drift.dart';

/// 会员
@DataClassName('Member')
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get phone => text()();

  RealColumn get money => real().withDefault(const Constant(0))();

  IntColumn get discount => integer().withDefault(const Constant(90))();

  TextColumn get createTime => text()();
}
