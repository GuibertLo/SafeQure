import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/models/rest.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrData extends StatelessWidget {
  Barcode result;
  Function launchScan;
  QrData(this.result, this.launchScan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,

        width: 60 / 100 * MediaQuery.of(context).size.width,
        child: ElevatedButton(
            child: Text(
              result.url!.url!,
            ) /*'Barcode Type: ${describeEnum(result.format)}   Data: ${result.url?.url}')*/,
            onPressed: Uri.parse(result.url?.url ?? "").isAbsolute
                ? () => {ApiRequestVT.runScan(result.url!.url!)}
                : null));
  }
}
