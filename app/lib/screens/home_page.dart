import 'package:app/screens/history_screen.dart';
import 'package:app/screens/scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: AppLocalizations.of(context)!.scanner),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list_rounded),
              label: AppLocalizations.of(context)!.history),
        ],
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
      ),
    );
  }
}
