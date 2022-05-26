import 'package:app/storage/database.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/list_scans.dart';

class HistoryScreen extends StatelessWidget {

  const HistoryScreen(
      {Key? key,
      })
      : super(key: key);


  static const String route = "/listScans";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return StreamBuilder<List<ScansTableData>>(
      stream: Provider.of<ResponsesRepository>(context).getAllResponses(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            if (snapshot.hasError) {
              return const Text('Error fetching scans! Please contact the developer.');
            } else {
              List<ScansTableData> responses = snapshot.data!;
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
                        "No stored scans.",
                        style: TextStyle(fontSize: height * 0.02),
                      )
                    ],
                  ),
                );
              } else {
                return ListScans(
                    responses: responses
                );
              }
            }
          }
      }
    );
  }
}
