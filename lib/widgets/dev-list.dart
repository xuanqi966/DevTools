import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dev_tools/provider/DevScraper.dart';
import './dev-list-item.dart';
import '../util/my-logger.dart';

class DevList extends StatefulWidget {
  @override
  _DevListState createState() => _DevListState();
}

class _DevListState extends State<DevList> {
  final logger = getLogger('DevList');

  Future<void> _onRefreshHandler(BuildContext context) async {
    Provider.of<DevScraper>(context, listen: false).clearDevelopers();
    await Provider.of<DevScraper>(context, listen: false).updateScraper();
    logger.i('onRefreshHandler | Refreshed');
  }

  @override
  void initState() {
    Provider.of<DevScraper>(context, listen: false)
        .initScraper()
        .catchError((e) => print(e.error));
    logger.i('initState | Initialisation complete!');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i('build | building DevList...');
    final devData = Provider.of<DevScraper>(context);
    if (devData.isError) {
      return Expanded(
          child: Center(
        child: Text(
          'Connection error occured. Please try again.',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ));
    } else if (devData.getDevelopers.isEmpty) {
      if (devData.isNothingFound) {
        return Expanded(
            child: Center(
                child: Text(
          'No developers found.',
          style: Theme.of(context).textTheme.headline1,
        )));
      }
      return Expanded(
          child: Center(
              child: CupertinoActivityIndicator(
        radius: 20,
      )));
    } else {
      logger.i('build | Developers: ${devData.getDevelopers.length}');
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Language: ',
                        ),
                        Text(
                          devData.getLanguage,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Date Range: '),
                        Text(
                          devData.getDateRange,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _onRefreshHandler(context),
                child: ListView.builder(
                  itemCount: devData.getDevelopers.length,
                  itemBuilder: (ctx, index) {
                    return DevListItem(devData.getDevelopers[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
