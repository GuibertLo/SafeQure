import 'package:app/repository/database.dart';
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../models/response.dart';

class LocalApi {
  final MyDatabase _db;

  LocalApi({required MyDatabase myDatabase}) : _db = myDatabase;

  Future<void> deleteResponse(int id) async {
    await _db.deleteScan(id);
  }

  Future<void> saveResponse(ScanReqResponse newScan) async {
    await _db.saveScan(ScansTableCompanion(
        url: Value(newScan.url),
        websiteThreatType: Value(newScan.websiteThreatType),
        httpCode: Value(newScan.httpCode),
        cleanResult : Value(newScan.cleanResult),
        virusFoundCount: Value(newScan.virusFound.length)));
  }

  Stream<List<ScansTableData>> getAllResponses() => _db.allScans;

  Future<List<ScansTableData>> getResponseById(int id) => _db.getScan(id);

}
