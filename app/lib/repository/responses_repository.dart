import 'package:app/models/response.dart';

/// The repo must fetch todos from an API or DB for the moment we
/// return this sample list
class ResponsesRepository {

  final LocalApi _localApi;
  /// Normally theses todos must come from an API
  final List<ScanReqResponse> _responses = [
    ScanReqResponse(cleanResult: false, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id1"),
    ScanReqResponse(cleanResult: true, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id2"),
    ScanReqResponse(cleanResult: true, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id3")
  ];

  // Call local API
  List<ScanReqResponse> get allResponses => _localApi.getAllResponses;
}
