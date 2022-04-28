import 'package:app/models/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class DetailScreen extends StatelessWidget {

  final ScanReqResponse response;
  final Function onDelete;

  const DetailScreen({
    Key? key,
    required this.response,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Response details"),
      ),
      body: Selector<AppState, ScanReqResponse?>(
        shouldRebuild: (prev, next) => next != null,
        selector: (context, model) => model.responseById(response.id),
        builder: (context, t, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 16.0,
                            ),
                            child: Text(
                              response.websiteThreatType,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Text(
                            response.httpCode.toString(),
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Delete scan",
        child: const Icon(Icons.delete_rounded),
        backgroundColor: Colors.red,
        onPressed: () {
          onDelete();
          Navigator.pop(context);
         },
       ),
    );
  }
}
