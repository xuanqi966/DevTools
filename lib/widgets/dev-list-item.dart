import 'package:dev_tools/pages/trend-scraper/web-page.dart';
import 'package:dev_tools/provider/DevScraper.dart';
import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:flutter/material.dart';
import '../models/trend-scrapper/Repository.dart';
import '../models/trend-scrapper/Developer.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DevListItem extends StatelessWidget {
  final Developer developer;

  DevListItem(this.developer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(developer.avatorUrl),
                backgroundColor: Colors.transparent,
              ),
            ),
            title: Text(
              developer.userName,
              style: Theme.of(context).textTheme.headline2,
            ),
            subtitle: (developer.accName == 'N.A')
                ? null
                : Text(
                    developer.accName,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 18),
                  ),
            trailing: IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                _visitWebPage(
                    RepoScraper.gitHubAddress + developer.accUrl, context);
              },
            ),
          ),
          if (developer.repository.title != 'N.A')
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        MaterialCommunityIcons.fire,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Text(
                        'POPULAR REPO',
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      )
                    ],
                  ),
                ),
                ListTile(
                  //leading: Icon(MaterialCommunityIcons.source_repository),
                  title: Row(
                    children: [
                      Icon(MaterialCommunityIcons.source_repository),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          developer.repository.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 18, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  subtitle: (developer.repository.descriptions == 'N.A')
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            developer.repository.descriptions,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontSize: 16),
                          ),
                        ),
                  trailing: IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      _visitWebPage(
                          RepoScraper.gitHubAddress + developer.repository.url,
                          context);
                    },
                  ),
                )
              ],
            )
        ],
      ),
    );
  }

  void _visitWebPage(String url, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WebPage(url);
    }));
  }
}
