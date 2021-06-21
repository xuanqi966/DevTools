import 'package:dev_tools/models/trend-scrapper/Repository.dart';
import 'package:dev_tools/pages/trend-scraper/web-page.dart';
import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:flutter/material.dart';
import '../models/trend-scrapper/Repository.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../util/my-logger.dart';

class RepoListItem extends StatelessWidget {
  final logger = getLogger('RepoListItem');

  final Repository repo;

  RepoListItem(this.repo);

  void _openPage(String url, BuildContext context) {
    logger.i('visitWebPage | Navigating to $url');
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WebPage(url);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () => _openPage(RepoScraper.gitHubAddress + repo.url, context),
        focusColor: Colors.black,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(MaterialCommunityIcons.source_repository),
                      Expanded(
                        child: Text(
                          repo.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                if (repo.descriptions != 'N.A')
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      repo.descriptions,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                if (repo.contributors.length > 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Built by",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...repo.contributors
                                .map((con) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3),
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundImage:
                                            NetworkImage(con.avatorUrl),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ))
                                .toList()
                          ],
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (repo.language != 'N.A')
                        Text(
                          repo.language,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      if (repo.language != 'N.A')
                        SizedBox(
                          width: 10,
                        ),
                      if (repo.stars != 'N.A')
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star_outline,
                              color: Colors.orange,
                            ),
                            Text(repo.stars)
                          ],
                        ),
                      if (repo.stars != 'N.A')
                        SizedBox(
                          width: 10,
                        ),
                      if (repo.forks != 'N.A')
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesome.code_fork,
                              color: Colors.blueAccent,
                            ),
                            Text(repo.forks)
                          ],
                        ),
                    ],
                  ),
                ),
                if (repo.starsNow != 'N.A')
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.star_border),
                        Text(
                          repo.starsNow,
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
