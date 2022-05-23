import 'dart:convert';

import 'package:app/models/response.dart';
import 'package:http/http.dart' as http;

class ApiRequestVT {
  static const String _root = "https://api.cloudmersive.com/";
  static const String _resource = "website/";
  static const String _typeApi = "virus/";
  static const String _typeRequest = "scan/";
  static const String _apiKey = "47eedab4-66d6-4974-874a-b838e83e6989";
  static Future<http.Response> fetchScan(String url) {
    final Map<String, String> queryHeader = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Apikey': _apiKey,
    };

    final Map<String, String> queryBody = {'Url': url};

    return http.post(Uri.parse(_root + _typeApi + _typeRequest + _resource),
        headers: queryHeader, body: queryBody);
  }

  static Future<ScanReqResponse?> runScan(String url) async {
    ScanReqResponse? reqResponse;
    http.Response resp = await fetchScan(url);
    reqResponse = ScanReqResponse.fromJson(jsonDecode(resp.body));
    if (reqResponse == null) {
      throw Exception('Failed to fetch scan');
    }
    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return reqResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("error");
      return null;
    }
  }
}
