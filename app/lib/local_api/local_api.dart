import 'package:app/repository/tables.dart';

import '../models/response.dart';

class LocalApi {
  final MyDatabase _db;

  LocalApi({required MyDatabase myDatabase}) : _db = myDatabase;

  // @override
  // Future<void> deleteTodo(String id) async {
  //   await _db.deleteTodo(id);
  // }

  /*@override
  Stream<List<Todo>> getTodos() => _db..asyncMap((event) {
    return event.map((e) => Todo.fromDrift(e)).toList();
  });

  @override
  Future<void> saveScan(ScanReqResponse newScan) async {
    await _db.saveScan(ScansTableData(
        complete: todo.complete,
        id: todo.id,
        note: todo.note,
        task: todo.task));
  }*/
}
