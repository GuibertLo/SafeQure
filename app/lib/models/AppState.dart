import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../model/response.dart';

// TODO: 1.1 DONE We will use our AppState model as a global app state. To notify
//         children widgets when the data has changed, we need to extends
//         ChangeNotifier class. This model will be "provided" to the children.
//         You can look at the updateTodo method below to see how to notify
//         widgets that listen to our model. Next step -> go to app.dart

class AppState extends ChangeNotifier {
  List<ScanReqResponse> scans;

  AppState({required this.scans});

  int get nbCompleted =>
      scans.fold(0, (sum, todo) => todo.cleanResult ? ++sum : sum);

  ScanReqResponse? scanById(String id) {
    //return ScanReqResponse.firstWhereOrNull((e) => e.id == id);
    //TODO: see why not working
    return null;
  }

  void addScan(ScanReqResponse response) {
    scans.add(response);
    notifyListeners();
  }

  void removeScan(ScanReqResponse response) {
    scans.remove(response);
    notifyListeners();
  }

  // TODO: complete
  // void updateScan(
  //     ScanReqResponse response, {
  //       bool? complete,
  //       String? id,
  //       String? note,
  //       String? task,
  //     }) {
  //   todo.complete = complete ?? todo.complete;
  //   todo.id = id ?? todo.id;
  //   todo.note = note ?? todo.note;
  //   todo.task = task ?? todo.task;
  //   notifyListeners();
  // }
}

enum AppTab { scanner, list }
