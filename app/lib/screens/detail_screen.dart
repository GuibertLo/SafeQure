import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as custom;

import '../storage/database.dart';

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
      body: custom.Selector<ResponsesRepository, ScansTableData?>(
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
                              child: header(context, response)),
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

  Widget header(BuildContext context, ScansTableData response) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (height < width) {
      //Screen rotated
      double tmp = height;
      height = width;
      width = tmp;
    }
    return Center(
        child: Column(children: [
      Container(
          width: width * 0.4,
          child: Image(
              image: response.cleanResult
                  ? AssetImage('rsc/img/insurance.png')
                  : AssetImage('rsc/img/shield.png'))),
      Text(
        Uri.parse(response.url).host,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ]));
  }
}
