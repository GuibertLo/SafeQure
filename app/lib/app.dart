import 'package:app/repository/repository.dart';
import 'package:app/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final ResponsesRepository repository;

  @override
  State<App> createState() => _AppState();
}

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         //create: (_) => AppState(responses: widget.repository.responses),
//         create: (_) => AppState(),
//         child: MaterialApp(
//           localizationsDelegates: const [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: const [
//             Locale('fr', ''), // French, no country code
//             Locale('en', ''), // English, no country code
//           ],
//           routes: {
//             HomeScreen.route: (context) => const HomeScreen()
//           },
//           initialRoute: HomeScreen.route,
//         ));
//   }
// }

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: widget.repository,
        child: MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('fr', ''), // French, no country code
              Locale('en', ''), // English, no country code
            ],
            routes: {
              HomeScreen.route: (context) => const HomeScreen()
            },
            initialRoute: HomeScreen.route,
          )
      );
  }
}