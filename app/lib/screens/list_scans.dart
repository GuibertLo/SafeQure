import 'package:flutter/material.dart';

import '../widgets/scanner.dart';

class ListScans extends StatefulWidget {

  const ListScans({
    Key? key,
  }) : super(key: key);

  static const String route = "/listScans";

  @override
  State<ListScans> createState() => _ListScansState();
}

class _ListScansState extends State<ListScans> {

  @override
  Widget build(BuildContext context) {
      return const QRViewExample();
  }
}
