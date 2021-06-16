import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './repo-list-item.dart';
import './filter-dropdown-button.dart';

class RepoList extends StatefulWidget {
  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  Future<void> _onRefreshHandler(BuildContext context) async {
    await Provider.of<RepoScraper>(context, listen: false).loadRepos();
    print("Refreshed!");
  }

  @override
  void initState() {
    Provider.of<RepoScraper>(context, listen: false).initScraper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repoData = Provider.of<RepoScraper>(context);

    if (repoData.getRepos.isEmpty) {
      return Expanded(child: Center(child: CircularProgressIndicator()));
    } else {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () => _onRefreshHandler(context),
          child: ListView.builder(
            itemCount: repoData.getRepos.length,
            itemBuilder: (ctx, index) {
              print(repoData.getRepos.length);
              return RepoListItem(repoData.getRepos[index]);
            },
          ),
        ),
      );
    }
  }
}
