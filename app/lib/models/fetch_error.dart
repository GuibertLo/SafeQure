import 'package:app/storage/database.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/detail_screen.dart';

void _cancelPressed(BuildContext context, Function onCancel) {
  onCancel();
  Navigator.pop(context, 'Cancel');
}

Future<dynamic> onErrorFetch(BuildContext context, Function onCancel) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.errorFetchTitle),
      content: Text(AppLocalizations.of(context)!.errorFetchDescription),
      actions: <Widget>[
        TextButton(
          onPressed: () => _cancelPressed(context, onCancel),
          child: Text(AppLocalizations.of(context)!.yes),
        ),
      ],
    ),
  );
}
