import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/models/rest.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrData extends StatelessWidget {
  Barcode result;
  QrData(this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: result.corners![1].dx,
      top: result.corners![1].dy,
      child: Container(
          color: Colors.red,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    (result.corners![1].dx - result.corners![0].dx),
                    10), // takes postional arguments as width and height
              ),
              child: Text(
                'Scan Me',
              ) /*'Barcode Type: ${describeEnum(result.format)}   Data: ${result.url?.url}')*/,
              onPressed: Uri.parse(result.url?.url ?? "").isAbsolute
                  ? () => {ApiRequestVT.runScan(result.url!.url!)}
                  : null)),
    );
    ;
  }
}
