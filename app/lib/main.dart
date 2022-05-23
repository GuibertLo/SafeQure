import 'package:app/local_api/local_api.dart';
import 'package:app/repository/responses_repository.dart';
import 'package:app/repository/tables.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  final localApi = LocalApi(myDatabase: MyDatabase());

  runApp(App(
      // repository: ResponsesRepository(localApi),
      ));
}
