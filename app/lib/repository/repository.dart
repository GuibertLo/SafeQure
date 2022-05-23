import 'package:app/models/response.dart';
import 'package:app/repository/database.dart';

import '../local_api/local_api.dart';

/// The repo must fetch todos from an API or DB for the moment we
/// return this sample list
class ResponsesRepository {
  const ResponsesRepository(LocalApi localApi) : _localApi = localApi;

  final LocalApi _localApi;
  /// Normally theses todos must come from an API
  // final List<ScanReqResponse> _responses = [
  //   ScanReqResponse(cleanResult: false, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id1"),
  //   ScanReqResponse(cleanResult: true, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id2"),
  //   ScanReqResponse(cleanResult: true, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id3")
  // ];

  // Call local API
  Stream<List<ScansTableData>> getAllResponses() => _localApi.getAllResponses();

  Future<void> saveResponse(ScanReqResponse scan) => _localApi.saveResponse(scan);

  Future<void> deleteResponse(int id) => _localApi.deleteResponse(id);
}
