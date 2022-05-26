import 'package:app/models/response.dart';
import 'package:app/storage/database.dart';
import '../api/local_api.dart';

/// The repo must fetch todos from an API or DB for the moment we
/// return this sample list
class ResponsesRepository {
  const ResponsesRepository(LocalApi localApi) : _localApi = localApi;

  final LocalApi _localApi;

  // Call local API
  Stream<List<ScansTableData>> getAllResponses() => _localApi.getAllResponses();

  Future<void> saveResponse(ScanReqResponse scan) => _localApi.saveResponse(scan);

  Future<void> deleteResponse(int id) => _localApi.deleteResponse(id);

  Future<List<ScansTableData>> getResponseById(int id) => _localApi.getResponseById(id);
}

enum AppTab { scanner, list }