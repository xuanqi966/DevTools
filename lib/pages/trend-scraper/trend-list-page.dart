import 'package:dev_tools/provider/TrendScraper.dart';
import 'package:dev_tools/widgets/trend-filter-drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/repo-list-item.dart';
import '../../widgets/repo-list.dart';
import '../../widgets/filter-dropdown-button.dart';

class TrendListPage extends StatefulWidget {
  static final routeName = '/trend-list';

  @override
  _TrendListPageState createState() => _TrendListPageState();
}

class _TrendListPageState extends State<TrendListPage> {
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
        endDrawer: TrendFilterDrawer(),
        body: Column(
          children: [RepoList()],
        ));
  }
}
