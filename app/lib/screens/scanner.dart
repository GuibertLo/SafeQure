import 'package:flutter/material.dart';

import '../widgets/scanner.dart';

class Scanner extends StatefulWidget {

  const Scanner({
    Key? key,
  }) : super(key: key);

  static const String route = "/scanner";

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const QRViewExample(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.flashlight_on),
        onPressed: () {
          // TODO: turn on flashlight
        }
      ),
    );



  }
}
