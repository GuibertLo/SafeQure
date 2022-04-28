import 'package:app/repository/responses_repository.dart';
import 'package:flutter/material.dart';

import 'app.dart';


void main() {
  runApp(App(
      repository: ResponsesRepository(),
  ));
}