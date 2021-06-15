import 'package:dev_tools/provider/TrendScraper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './repo-list-item.dart';
import './filter-dropdown-button.dart';

class RepoList extends StatefulWidget {
  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  Future _loadFuture;

  Future<void> _onRefreshHandler(BuildContext context) async {
    await Provider.of<TrendScraper>(context, listen: false).loadRepos();
    print("Refreshed!");
  }

  @override
  void initState() {
    _loadFuture =
        Provider.of<TrendScraper>(context, listen: false).loadAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repoData = Provider.of<TrendScraper>(context);
    return Expanded(
        child: FutureBuilder(
            future: _loadFuture,
            builder: (ctx, data) {
              if (data.connectionState == ConnectionState.waiting) {
                // print(data.connectionState);
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // print(data.connectionState);
                return RefreshIndicator(
                  onRefresh: () => _onRefreshHandler(context),
                  child: ListView.builder(
                    itemCount: repoData.getRepos.length,
                    itemBuilder: (ctx, index) {
                      print(repoData.getRepos.length);
                      return RepoListItem(repoData.getRepos[index]);
                    },
                  ),
                );
              }
            }));
  }
}
