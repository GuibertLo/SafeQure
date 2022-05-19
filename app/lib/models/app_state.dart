import 'package:app/models/response.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


// TODO: 1.1 DONE We will use our AppState models as a global app state. To notify
//         children widgets when the data has changed, we need to extends
//         ChangeNotifier class. This models will be "provided" to the children.
//         You can look at the updateTodo method below to see how to notify
//         widgets that listen to our models. Next step -> go to app.dart

class AppState extends ChangeNotifier {
late List<ScanReqResponse> responses;

//AppState({required this.responses});

int get nbCompleted =>
responses.fold(0, (sum, todo) => todo.cleanResult ? ++sum : sum);

ScanReqResponse? responseById(String id) {
return responses.firstWhereOrNull((e) => e.id == id);
//TODO: see why not working
return null;
}

void addResponse(ScanReqResponse response) {
responses.add(response);
notifyListeners();
}

void deleteResponse(ScanReqResponse response) {
responses.remove(response);
notifyListeners();
}

}

enum AppTab { scanner, list }
