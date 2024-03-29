// ignore: slash_for_doc_comments
import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/**
* WebsiteScanResult{
* description:	
*   Result of running a website scan
*   CleanResult	boolean
*       True if the scan contained no threats, false otherwise
* 
*   WebsiteThreatType	string
*       Type of threat returned; can be None, Malware, ForcedDownload or Phishing
* 
*       Enum:
*         [ None, Malware, Phishing, ForcedDownload, UnableToConnect ]
*   FoundViruses
* 	  [
*       Array of viruses found, if any
*       
*       VirusFound{
*       description:	
*         Virus positively identified
*         FileName	string
*           Name of the file containing the virus
*         VirusName	string
*           Name of the virus that was found
*       }
*     ]
* WebsiteHttpResponseCode	integer($int32)
* The remote server URL HTTP reasponse code; useful for debugging issues with scanning; typically if the remote server returns a 200 or 300-series code this means a successful response, while a 400 or 500 series code would represent an error returned from the remote server for the provided URL.
* 
* }
 */

class VirusFound {
  final String name;
  final String file;
  const VirusFound({required this.name, required this.file});
  factory VirusFound.fromJson(Map<String, dynamic> json) {
    return VirusFound(name: json['VirusName'], file: json['FileName']);
  }
}

class ScanReqResponse {
  final bool cleanResult;
  final String websiteThreatType;
  final String url;
  final List<VirusFound> virusFound;
  final int httpCode;

  ScanReqResponse(
      {required this.cleanResult,
      required this.websiteThreatType,
      required this.url,
      required this.virusFound,
      required this.httpCode});

  factory ScanReqResponse.fromJson(Map<String, dynamic> json, String url) {
    List<dynamic>? listVF = json['FoundViruses'] as List?;
    return ScanReqResponse(
      cleanResult: json['CleanResult'],
      websiteThreatType: json['WebsiteThreatType'],
      url: url,
      httpCode: json['WebsiteHttpResponseCode'],
      virusFound: listVF == null
          ? []
          : listVF
              .map((jsonVirusFound) => VirusFound.fromJson(jsonVirusFound))
              .toList(),
    );
  }
}
