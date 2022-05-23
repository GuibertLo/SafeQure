import 'package:app/repository/database.dart';
import 'package:uuid/uuid.dart';
import '../models/response.dart';

class LocalApi {
  final MyDatabase _db;

  LocalApi({required MyDatabase myDatabase}) : _db = myDatabase;

  Future<void> deleteResponse(int id) async {
    await _db.deleteScan(id);
  }

  Future<void> saveResponse(ScanReqResponse newScan) async {
    await _db.saveScan(ScansTableData(
        id: 1,
        websiteThreatType: newScan.websiteThreatType,
        httpCode: newScan.httpCode,
        cleanResult : newScan.cleanResult,
        virusFoundCount: newScan.virusFound.length));
  }

  Stream<List<ScansTableData>> getAllResponses() => _db.allScans;
}
