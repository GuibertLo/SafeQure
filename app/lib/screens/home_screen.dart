import 'package:flutter/material.dart';

import '../widgets/scanner.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String route = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan"),
      ),
      body: const QRViewExample()

    );
  }
}
