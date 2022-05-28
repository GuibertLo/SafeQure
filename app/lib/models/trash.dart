import 'package:app/storage/database.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/detail_screen.dart';

_trashValidate(BuildContext context, ScansTableData response) {
  Provider.of<ResponsesRepository>(context, listen: false)
      .deleteResponse(response.id);
  Navigator.pop(context, 'OK');
  Navigator.pop(context);
}

Future<dynamic> onTrash(BuildContext context, ScansTableData response) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.trashConfirm),
      content: Text(AppLocalizations.of(context)!.trashDescription),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        TextButton(
          onPressed: () => {_trashValidate(context, response)},
          child: Text(AppLocalizations.of(context)!.yes),
        ),
      ],
    ),
  );
}
