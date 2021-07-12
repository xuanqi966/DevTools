import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './repo-list-item.dart';
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
    logger.i('build | building RepoList...');
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "GitHub Trending",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 1.0,
                  height: 30.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Spoken: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            repoData.getSpoken,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Language: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          repoData.getLanguage,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Date Range: ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          repoData.getDate,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ],
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
        ),
      );
    }
  }
}
