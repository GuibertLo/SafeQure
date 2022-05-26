import 'package:app/screens/history_screen.dart';
import 'package:app/screens/scanner_screen.dart';
import 'package:flutter/material.dart';

import '../repository/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const String route = "/homeScreen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppTab activeTab = AppTab.scanner;

  // Because activeTab is specific to this widget only, it is not useful to
  // put this state in Provider.
  void _updateTab(AppTab appTab) {
    setState(() {
      activeTab = appTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SafeQure"),
      ),
      body: activeTab == AppTab.scanner
          ? const ScannerScreen()
          : const HistoryScreen(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: AppTab.values.indexOf(activeTab),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: "Scanner"),
          BottomNavigationBarItem(icon: Icon(Icons.view_list_rounded), label: "History"),
        ],
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
      ),
    );
  }
}
