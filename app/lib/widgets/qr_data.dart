import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrData extends StatefulWidget {
  Barcode result;
  Function launchScan;
  final _QrDataState qrstate = _QrDataState();
  QrData(this.result, this.launchScan, {Key? key}) : super(key: key);

  @override
  State<QrData> createState() => qrstate;
  void resetLoading() => qrstate.resetLoading();
}

class _QrDataState extends State<QrData> {
  bool isScanning = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < screenWidth) {
      double tmp = screenHeight;
      screenHeight = screenWidth;
      screenWidth = tmp;
    }

    //IMPORTANT we already checked that URL is valid
    return Container(
        // color: Colors.red,
        height: 5 / 100 * screenHeight,
        width: 60 / 100 * screenWidth,
        child: ElevatedButton(
            child: isScanning
                ? const SpinKitCircle(
                    color: Colors.white,
                    size: 30.0,
                  )
                : Text(
                    Uri.parse(widget.result.url!.url!).host,
                  ),
            onPressed: () {
              setState(() {
                isScanning = true;
              });
              widget.launchScan(context, widget.result.url!.url!);
            }));
  }

  void resetLoading() {
    setState(() {
      isScanning = false;
    });
  }
}
