import 'package:dev_tools/widgets/trend-filter-drawer.dart';
import 'package:dev_tools/widgets/dev-filter-drawer.dart';
import 'package:flutter/material.dart';

import '../../widgets/repo-list.dart';
import '../../widgets/dev-list.dart';

class TrendListPage extends StatefulWidget {
  static final routeName = '/trend-list';

  @override
  _TrendListPageState createState() => _TrendListPageState();
}

class _TrendListPageState extends State<TrendListPage> {
  bool _isShowingRepo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Trendy Repos",
            style: Theme.of(context).textTheme.headline1,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        endDrawer: _isShowingRepo ? TrendFilterDrawer() : DevFilterDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [DevList()],
        ));
  }
}
