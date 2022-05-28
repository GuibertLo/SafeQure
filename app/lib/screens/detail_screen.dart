import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as custom;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../storage/database.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final ScansTableData response;
  final Function onDelete;

  const DetailScreen({
    Key? key,
    required this.response,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.responseDetail),
      ),
      body: custom.Selector<ResponsesRepository, ScansTableData?>(
        shouldRebuild: (prev, next) => next != null,
        selector: (context, model) => response,
        builder: (context, t, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 16.0,
                              ),
                              child: header(context, response)),
                          body(context, response)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: AppLocalizations.of(context)!.deleteScan,
        child: const Icon(Icons.delete_rounded),
        backgroundColor: Colors.red,
        onPressed: () => {onDelete(context, response)},
      ),
    );
  }

  Widget header(BuildContext context, ScansTableData response) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (height < width) {
      //Screen rotated
      double tmp = height;
      height = width;
      width = tmp;
    }
    return Center(
        child: Column(children: [
      Container(
          width: width * 0.4,
          child: Image(
              image: response.cleanResult
                  ? AssetImage('rsc/img/insurance.png')
                  : AssetImage('rsc/img/shield.png'))),
      Text(
        Uri.parse(response.url).host,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ]));
  }

  Widget body(BuildContext context, ScansTableData response) {
    return Container(
      child: Column(children: [
        Divider(),
        Container(
            height: 50,
            child: Row(children: [
              Flexible(
                  flex: 3,
                  child: Container(
                      width: double.infinity,
                      child: Text(AppLocalizations.of(context)!.ammountVirus,
                          style: Theme.of(context).textTheme.subtitle1))),
              Flexible(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    child: Center(
                        child: Text(response.virusFoundCount.toString(),
                            style: Theme.of(context).textTheme.subtitle1))),
              )
            ])),
        Divider(),
        Container(
            height: 50,
            child: Row(children: [
              Flexible(
                  flex: 5,
                  child: Container(
                      width: double.infinity,
                      child: Text(AppLocalizations.of(context)!.dateOfScan,
                          style: Theme.of(context).textTheme.subtitle1))),
              Flexible(
                flex: 3,
                child: Container(
                    width: double.infinity,
                    child: Center(
                        child: Text(response.dateScan.toString(),
                            style: Theme.of(context).textTheme.subtitle1))),
              )
            ])),
        Divider(),
        ElevatedButton(
            onPressed: _lunchUrl,
            child: Text(AppLocalizations.of(context)!.openLink))
      ]),
    );
  }

  _lunchUrl() async {
    Uri url = Uri.parse(response.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
