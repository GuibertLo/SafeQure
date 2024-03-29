import 'package:app/storage/database.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/trash.dart' as Trash;

import 'response_item.dart';
import '../screens/detail_screen.dart';

class ListScans extends StatelessWidget {
  const ListScans({
    Key? key,
    required this.responses,
  }) : super(key: key);

  final List<ScansTableData> responses;

  //static const String route = "/listScans";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: responses.length,
        itemBuilder: (context, index) {
          ScansTableData response = responses[index];
          return ResponseItem(
              response: response,
              onDetails: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                        response: response,
                        onDelete: Trash.onTrash,
                      );
                    }))
                  },
              onTrash: () => Trash.onTrash(context, response));
        });
  }

  //@override
  //State<ListScans> createState() => _ListScansState(responses);
}
