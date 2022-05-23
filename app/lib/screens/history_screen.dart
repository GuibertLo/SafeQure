import 'package:app/models/response.dart';
import 'package:app/repository/database.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_scans.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen(
      {Key? key,
      })
      : super(key: key);


  static const String route = "/listScans";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final responses = Provider.of<ResponsesRepository>(context).getAllResponses();

    if (responses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_off,
              size: height * 0.04,
            ),
            Text(
              "Todos empty",
              style: TextStyle(fontSize: height * 0.02),
            )
          ],
        ),
      );
    }

    return ListScans(
        responses: responses
    );
  }
}
