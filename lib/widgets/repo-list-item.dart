import 'package:dev_tools/models/trend-scrapper/Repository.dart';
import 'package:dev_tools/pages/trend-scraper/web-page.dart';
import 'package:dev_tools/provider/TrendScraper.dart';
import 'package:flutter/material.dart';
import '../models/trend-scrapper/Repository.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RepoListItem extends StatelessWidget {
  final Repository repo;

  RepoListItem(this.repo);

  void _openPage(String url, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WebPage(url);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openPage(TrendScraper.rootAddress + repo.url, context),
      child: Card(
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(MaterialCommunityIcons.source_repository),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        repo.title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  )
                ],
              ),
              if (repo.descriptions != 'N.A')
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    repo.descriptions,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              if (repo.contributors.length > 0)
                Row(
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
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
              Row(
                children: [
                  if (repo.language != 'N.A')
                    Text(
                      repo.language,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  if (repo.language != 'N.A')
                    SizedBox(
                      width: 20,
                    ),
                  if (repo.stars != 'N.A')
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.star_outline), Text(repo.stars)],
                    ),
                  if (repo.stars != 'N.A')
                    SizedBox(
                      width: 20,
                    ),
                  if (repo.forks != 'N.A')
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(FontAwesome.code_fork), Text(repo.forks)],
                    ),
                ],
              ),
              if (repo.starsNow != 'N.A')
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(
                      repo.starsNow,
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
