import 'package:app/model/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgets/response_item.dart';


class ListScans extends StatelessWidget {

  const ListScans({
    Key? key,
    required this.responses,
  }) : super(key: key);

  final List<ScanReqResponse> responses;

  //static const String route = "/listScans";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: responses.length,
        itemBuilder: (context, index) {
          ScanReqResponse response = responses[index];
          return ResponseItem(
            response: response,
            onDetails: () => _onDetails(context, response),
            onTrash: () => _onTrash(context, response),
          );
        });
  }

  //@override
  //State<ListScans> createState() => _ListScansState(responses);
}

void _onDetails(BuildContext context, ScanReqResponse response) {

  //navigate

  print("awd");
}


void _onTrash(BuildContext context, ScanReqResponse response) {

  //Provider.of<AppState>(context, listen: false).removeTodo(todo);

  print("awd");
}
