import 'package:drift/drift.dart';

@DataClassName('AppOption')
class AppOptions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get value => text()();

  TextColumn get type => text()();

  TextColumn get createTime => text()();
}
