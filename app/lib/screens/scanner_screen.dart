import 'package:app/models/response.dart';
import 'package:app/api/remote_api.dart';
import 'package:app/widgets/qr_data.dart';
import 'package:app/widgets/overlay.dart' as custom;
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

import '../repository/repository.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({
    Key? key,
  }) : super(key: key);

  static const String route = "/scanner";

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
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
                qrData = QrData(barcode, _launchScan);
              });
              // _launchScan(code!);
            }),
        custom.Overlay(qr: qrData),
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
    ScanReqResponse? scan = await ApiRequest.runScan(url);

    await Provider.of<ResponsesRepository>(context, listen: false).saveResponse(scan!);
  }
}
