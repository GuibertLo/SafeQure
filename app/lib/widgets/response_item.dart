import 'package:flutter/material.dart';

import '../storage/database.dart';

class ResponseItem extends StatelessWidget {
  const ResponseItem(
      {Key? key,
      required this.response,
      required this.onTrash,
      required this.onDetails})
      : super(key: key);

  final ScansTableData response;
  final GestureTapCallback onTrash;
  final GestureTapCallback onDetails;

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   title: Text(
    //     response.id,
    //   ),
    //   onTap: onDetails,
    //   subtitle: Text(response.websiteThreatType),
    //   onLongPress: onTrash,
    //
    // );
    return Card(
        child: ListTile(
      leading: response.cleanResult
          ? Container(
              width: 65,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(
                  color: Colors.greenAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text("Safe", style: TextStyle(color: Colors.white))),
            )
          : Container(
              width: 65,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text("Unsafe", style: TextStyle(color: Colors.white))),
            ),
      title: Text(Uri.parse(response.url).host),
      subtitle: response.cleanResult
          ? null
          : Text(response.websiteThreatType.toString()),
      trailing: const Icon(Icons.more_horiz_rounded),
      onTap: onDetails,
      onLongPress: onTrash,
    ));
  }
}
