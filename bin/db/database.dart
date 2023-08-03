import 'dart:io';

import 'package:drift/drift.dart';

import 'tables/card_record_table.dart';
import 'tables/card_table.dart';
import 'tables/cash_record_table.dart';
import 'tables/member_record_table.dart';
import 'tables/member_table.dart';
import 'tables/option_table.dart';
import 'tables/user_table.dart';

import 'package:path/path.dart' as p;
import 'package:drift/native.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Members,
    Cards,
    AppOptions,
    CashRecords,
    MemberRecords,
    CardRecords,
  ],
)
class MyDatabase extends _$MyDatabase {
  MyDatabase._() : super(_openConnection());

  factory MyDatabase() => _instance;
  static final MyDatabase _instance = MyDatabase._();

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (Migrator m) async {
          await m.createAll();
          await into(users).insert(
            const UsersCompanion(
              username: Value('admin'),
              password: Value('123'),
            ),
          );
        },
        onUpgrade: (Migrator m, int from, int to) async {},
      );
}

LazyDatabase _openConnection() => LazyDatabase(
      () async {
        final dbFolder =
            Platform.script.resolve('../../member_manage_db').toFilePath();
        final file = File(p.join(dbFolder, 'member_manage.sqlite'));
        return NativeDatabase.createInBackground(file);
      },
    );
