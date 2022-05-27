import 'package:app/repository/responses_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  //const App({Key? key, required this.repository}) : super(key: key);
  const App({Key? key}) : super(key: key);

  //final ResponsesRepository repository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        //create: (_) => AppState(responses: widget.repository.responses),
        create: (_) => AppState(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fr', ''), // French, no country code
            Locale('en', ''), // English, no country code
          ],
          routes: {
            /// TODO: 2.0 DONE remove functions and appState from the two constructors
            HomeScreen.route: (context) => const HomeScreen()
          },
          initialRoute: HomeScreen.route,
        ));
  }
}
