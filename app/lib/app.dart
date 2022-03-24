import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/scanner.dart';

class App extends StatefulWidget {
  const App() : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// TODO: 1.2 DONE Remove appState variable and initState method

  @override
  Widget build(BuildContext context) {
    /// TODO: 1.3 DONE return a ChangeNotifierProvider with MaterialApp as child
    ///           parameter and pass the todos to AppState constructor:
    ///
    return ChangeNotifierProvider(
        create: (_) => AppState(todos: widget.repository.todos),
        child: MaterialApp(
          routes: {
            /// TODO: 2.0 DONE remove functions and appState from the two constructors
            AddEditScreen.route: (context) => AddEditScreen(),
            HomeScreen.route: (context) => HomeScreen()
          },
          initialRoute: HomeScreen.route,
        )
    );

  }

/// TODO: 1.4 DONE move all todos functions to AppState model and remove them from app.dart.
///           Make changes to edit the todos list in AppState (todos.method instead of appState.todos.method)
///           and replace setState call with notifyListeners() (same as in updateTodo).


}
