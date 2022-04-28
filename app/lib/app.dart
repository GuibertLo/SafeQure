import 'package:app/repository/responses_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'screens/home_screen.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final ResponsesRepository repository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppState(responses: widget.repository.responses),
        child:  MaterialApp(
              routes: {
                /// TODO: 2.0 DONE remove functions and appState from the two constructors
                HomeScreen.route: (context) => const HomeScreen()
              },
              initialRoute: HomeScreen.route,
            )
    );
  }

}
