import 'package:app/local_api/local_api.dart';
import 'package:app/repository/repository.dart';
import 'package:app/repository/database.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  final localApi = LocalApi(myDatabase: MyDatabase());

  runApp(App(
      repository: ResponsesRepository(localApi),
      ));
}
