import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';


class ScansTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get websiteThreatType => text().withLength(min: 4, max: 2048)();
  TextColumn get url => text().withLength(min: 4, max: 2048)();
  IntColumn get httpCode => integer()();
  BoolColumn get cleanResult => boolean()();
  IntColumn get virusFoundCount => integer()();
}

@DriftDatabase(tables: [ScansTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Stream<List<ScansTableData>> get allScans => select(scansTable).watch();

  Future<List<ScansTableData>> getScan(int id) {
    return (select(scansTable)..where((tbl) => tbl.id.equals(id))).get();
  }

  Future<int> deleteScan(int id) {
    return (delete(scansTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> saveScan(ScansTableCompanion td) {
    return into(scansTable).insertOnConflictUpdate(td);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });
}
