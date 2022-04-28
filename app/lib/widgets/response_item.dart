import 'package:flutter/material.dart';

import '../models/response.dart';

class ResponseItem extends StatelessWidget {
  const ResponseItem(
      {Key? key,
        required this.response,
        required this.onTrash,
        required this.onDetails})
      : super(key: key);

  final ScanReqResponse response;
  final GestureTapCallback onTrash;
  final GestureTapCallback onDetails;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        response.id,
      ),
      onTap: onDetails,
      subtitle: Text(response.websiteThreatType),
      onLongPress: onTrash,

    );
  }
}
