import 'package:app/widgets/result.dart';
import 'package:app/widgets/overlay.dart' as custom;
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({
    Key? key,
  }) : super(key: key);

  static const String route = "/scanner";

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController cameraController = MobileScannerController();
  QrData? qrData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              final String? code = barcode.url?.url;
              setState(() {
                qrData = QrData(barcode);
              });
              // _launchScan(code!);
            }),
        qrData != null ? qrData! : Container(),
        custom.Overlay(),
      ]),
      floatingActionButton: FloatingActionButton(
        tooltip: "Delete scan",
        backgroundColor: Colors.white,
        child: ValueListenableBuilder(
          valueListenable: cameraController.torchState,
          builder: (context, state, child) {
            switch (state as TorchState) {
              case TorchState.off:
                return const Icon(Icons.flash_off, color: Colors.grey);
              case TorchState.on:
                return const Icon(Icons.flash_on, color: Colors.yellow);
            }
          },
        ),
        onPressed: () => cameraController.toggleTorch(),
      ),
    );
  }

  Future<void> _launchScan(String url) async {
    /*Thanks to nullable check, we are sure to have a valid url*/

    // int scan = runScan(code);
  }
}
