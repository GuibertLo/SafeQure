import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'tables.g.dart';


class ScansTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get websiteThreatType => text().withLength(min: 4, max: 2048)();
  IntColumn get httpCode => integer()();
  BoolColumn get cleanResult => boolean()();
  IntColumn get virusFoundCount => integer()();
}

@DriftDatabase(tables: [ScansTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<ScansTableData>> get allScans => select(scansTable).watch();

  Future<int> deleteScan(int id) {
    return (delete(scansTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> saveScan(ScansTableData td) {
    return into(scansTable).insertOnConflictUpdate(td);
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      print(p.join(dbFolder.toString(), 'todo_drift.sqlite'));
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file, logStatements: true);
    });
}
