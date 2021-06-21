import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './repo-list-item.dart';
import './filter-dropdown-button.dart';
import '../util/my-logger.dart';

class RepoList extends StatefulWidget {
  @override
  _RepoListState createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  final logger = getLogger('RepoList');

  Future<void> _onRefreshHandler(BuildContext context) async {
    Provider.of<RepoScraper>(context, listen: false).clearRepos();
    await Provider.of<RepoScraper>(context, listen: false).updateScraper();
    logger.i('onRefreshHandler | Refreshed');
  }

  @override
  void initState() {
    Provider.of<RepoScraper>(context, listen: false).initScraper();
    logger.i('initState | Initialisation complete!');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i('build | building DevList...');
    final repoData = Provider.of<RepoScraper>(context);
    if (repoData.isError) {
      return Center(
        child: Text(
          'Connection error occured. Please try again.',
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      );
    } else if (repoData.getRepos.isEmpty) {
      if (repoData.isNothingFound) {
        return Container(
          child: Center(
              child: Text(
            'No repositories found.',
            style: Theme.of(context).textTheme.headline1,
          )),
        );
      }
      return Center(
          child: CupertinoActivityIndicator(
        radius: 20,
      ));
    } else {
      logger.i('build | Developers: ${repoData.getRepos.length}');
      return SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Spoken: ',
                            ),
                            Expanded(
                              child: Text(
                                repoData.getSpoken,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
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
                          Expanded(
                            child: Text(
                              repoData.getLanguage,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Date Range: '),
                            Expanded(
                              child: Text(
                                repoData.getDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 12),
                              ),
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
                  itemCount: repoData.getRepos.length,
                  itemBuilder: (ctx, index) {
                    return RepoListItem(repoData.getRepos[index]);
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
