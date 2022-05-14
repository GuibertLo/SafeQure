import 'dart:io';

import 'package:drift/drift.dart';

part 'tables.g.dart';

// class ScansTable extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get websiteThreatType => text().withLength(min: 4, max: 2048)();
//   IntColumn get httpCode => integer()();
//   BoolColumn get cleanResult => boolean()();
//   IntColumn get virusFoundCount => integer()();
// }
//
// @DriftDatabase(tables: [ScansTable])
// class MyDatabase extends _$MyDatabase {
// }






//
// @DriftDatabase(tables: [ScansTable])
// class MyDatabase extends _$MyDatabase {
//   // we tell the database where to store the data with this constructor
//   MyDatabase() : super(_openConnection());
//
//   // you should bump this number whenever you change or add a table definition.
//   // Migrations are covered later in the documentation.
//   @override
//   int get schemaVersion => 1;
// }
//
// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }


// @DriftDatabase(tables: [ScansTable])
// class MyDatabase extends _$MyDatabase {
//   MyDatabase() : super(QueryExecutor.inDatabaseFolder(
//       path: 'db.sglite',
//       logStatements: true));
// }