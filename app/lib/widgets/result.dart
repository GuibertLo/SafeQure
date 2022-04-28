import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/models/rest.dart';

class QrData extends StatelessWidget {
  Barcode? result;
  QrData(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
            'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}'),
        onPressed: Uri.parse(result!.code!).isAbsolute
            ? () => {ApiRequestVT.runScan(result!.code.toString())}
            : null);
  }
}
