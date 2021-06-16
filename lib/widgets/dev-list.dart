import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dev_tools/provider/DevScraper.dart';
import './dev-list-item.dart';

class DevList extends StatefulWidget {
  @override
  _DevListState createState() => _DevListState();
}

class _DevListState extends State<DevList> {
  Future<void> _onRefreshHandler(BuildContext context) async {
    await Provider.of<DevScraper>(context, listen: false).updateScraper();
    print("Refreshed!");
  }

  @override
  void initState() {
    Provider.of<DevScraper>(context, listen: false)
        .initScraper()
        .catchError((e) => print(e.error));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devData = Provider.of<DevScraper>(context);
    if (devData.getDevelopers.isEmpty) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    } else {
      print(devData.getDevelopers.length);
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
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
                  )),
                  Expanded(
                      child: Row(
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
                  )),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _onRefreshHandler(context),
                child: ListView.builder(
                  itemCount: devData.getDevelopers.length,
                  itemBuilder: (ctx, index) {
                    print(devData.getDevelopers.length);
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
