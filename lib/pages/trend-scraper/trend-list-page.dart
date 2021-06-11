import 'package:dev_tools/provider/TrendScraper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/repo-list-item.dart';

class TrendListPage extends StatelessWidget {
  static final routeName = '/trend-list';

  @override
  Widget build(BuildContext context) {
    final repoData = Provider.of<TrendScraper>(context);
    //repoData.setAddress('https://github.com/trending');
    var repos = repoData.getRepos;
    print(repos.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trendy Repos",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (ctx, index) {
          print(repos.length);
          return RepoListItem(repos[index]);
        },
      ),
    );
  }
}
