import 'package:app/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../models/app_state.dart';
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


    final responses = [
      ScanReqResponse(cleanResult: true, websiteThreatType: "https://google.com", virusFound: [], httpCode: 200, id: "id")
    ];

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

    /// TODO: 2.6 DONE remove updateTodo and removeTodo, keep todos which will come from Provider
    ///          to TodoList widget

    return ListScans(
        responses: responses
    );
  }
}
