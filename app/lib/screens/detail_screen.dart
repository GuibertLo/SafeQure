import 'package:app/models/response.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as Custom;

import '../repository/database.dart';

class DetailScreen extends StatelessWidget {

  final ScansTableData response;
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
      body: Custom.Selector<ResponsesRepository, ScansTableData?>(
        shouldRebuild: (prev, next) => next != null,
        selector: (context, model) => response,
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
