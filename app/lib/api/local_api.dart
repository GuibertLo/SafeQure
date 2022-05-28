import 'package:app/storage/database.dart';
import 'package:drift/drift.dart';
import '../models/response.dart';

class LocalApi {
  final MyDatabase _db;

  LocalApi({required MyDatabase myDatabase}) : _db = myDatabase;

  Future<void> deleteResponse(int id) async {
    await _db.deleteScan(id);
  }

  Future<ScansTableData?> getScan(int id) async {
    return _db.getScan(id).first;
  }

  Future<ScansTableData?> getLastScan() async {
    return _db.getLastScan().first;
  }

  Future<void> saveResponse(ScanReqResponse newScan) async {
    await _db.saveScan(ScansTableCompanion(
        url: Value(newScan.url),
        websiteThreatType: Value(newScan.websiteThreatType),
        httpCode: Value(newScan.httpCode),
        cleanResult: Value(newScan.cleanResult),
        virusFoundCount: Value(newScan.virusFound.length)));
  }

  Stream<List<ScansTableData>> getAllResponses() => _db.allScans;

  Future<ScansTableData?> getResponseById(int id) => getScan(id);
}
