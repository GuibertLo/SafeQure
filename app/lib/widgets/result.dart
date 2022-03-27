import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:app/model/rest.dart';

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
