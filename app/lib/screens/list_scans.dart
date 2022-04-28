import 'package:app/models/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_state.dart';
import '../widgets/response_item.dart';
import 'detail_screen.dart';


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
            onDetails: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return DetailScreen(
                response: response,

                /// TODO: 2.8 DONE remove updateTodo
                onDelete: () => _onTrash(context, response),
              );
            }))
        },
          onTrash: () => _onTrash(context, response)
          );
        }
      );
  }

  //@override
  //State<ListScans> createState() => _ListScansState(responses);
}


void _onTrash(BuildContext context, ScanReqResponse response) {

  Provider.of<AppState>(context, listen: false).deleteResponse(response);

}
