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
  DateTimeColumn get dateScan => dateTime()();
}

@DriftDatabase(tables: [ScansTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  Stream<List<ScansTableData>> get allScans => (select(scansTable)
        ..orderBy(
            [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc)]))
      .watch();

  Stream<ScansTableData> getScan(int id) {
    return (select(scansTable)..where((tbl) => tbl.id.equals(id)))
        .watchSingle();
  }

  Stream<ScansTableData> getLastScan() {
    return (select(scansTable)
          ..orderBy(
              [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc)])
          ..limit(1))
        .watchSingle();
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
