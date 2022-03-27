import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
          routes: {
            /// TODO: 2.0 DONE remove functions and appState from the two constructors
            HomeScreen.route: (context) => const HomeScreen()
          },
          initialRoute: HomeScreen.route,
        );

  }

/// TODO: 1.4 DONE move all todos functions to AppState model and remove them from app.dart.
///           Make changes to edit the todos list in AppState (todos.method instead of appState.todos.method)
///           and replace setState call with notifyListeners() (same as in updateTodo).


}
