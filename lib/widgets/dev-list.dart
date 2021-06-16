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
    Provider.of<DevScraper>(context, listen: false).initScraper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devData = Provider.of<DevScraper>(context);
    print('haha');
    if (devData.getDevelopers.isEmpty) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    } else {
      print('yep');
      print(devData.getDevelopers.length);
      return Expanded(
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
      );
    }
  }
}
