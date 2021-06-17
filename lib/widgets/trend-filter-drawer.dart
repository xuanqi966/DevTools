import 'package:flutter/material.dart';
import 'package:dev_tools/provider/RepoScraper.dart';
import 'package:provider/provider.dart';

class TrendFilterDrawer extends StatefulWidget {
  @override
  _TrendFilterDrawerState createState() => _TrendFilterDrawerState();
}

class _TrendFilterDrawerState extends State<TrendFilterDrawer> {
  String _chosenSpoken;
  String _chosenLanguage;
  String _chosenDate;

  Map<String, String> spokenMap;
  Map<String, String> languageMap;
  Map<String, String> dateMap;

  @override
  void initState() {
    final repoData = Provider.of<RepoScraper>(context, listen: false);
    _chosenSpoken = repoData.getSpoken;
    _chosenLanguage = repoData.getLanguage;
    _chosenDate = repoData.getDate;

    spokenMap = repoData.getSpokenMap;
    languageMap = repoData.getLanMap;
    dateMap = repoData.getDateMap;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repoData = Provider.of<RepoScraper>(context, listen: false);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[300],
        child: Column(
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
            Divider(
              color: Colors.grey[900],
            ),
            Spacer(),
            Text(
              'Spoken Language',
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildSpokenButton(context, spokenMap)),
            Spacer(),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildLanguageButton(context, languageMap)),
            Spacer(),
            Text(
              'Date Range',
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildDateButton(context, dateMap)),
            Spacer(
              flex: 2,
            ),
            OutlinedButton(
              onPressed: () {
                repoData.clearRepos();
                repoData.updateSpoken(_chosenSpoken);
                repoData.updateLanguage(_chosenLanguage);
                repoData.updateDate(_chosenDate);
                repoData.updateScraper();
                Navigator.of(context).pop();
              },
              child: Text(
                "Confirm",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
              style: Theme.of(context).outlinedButtonTheme.style.copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blueAccent;
                } else {
                  return Colors.blue;
                }
              })),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
                onPressed: () {
                  repoData.clearRepos();
                  repoData.setDefaultFilter();
                  repoData.updateScraper();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Clear",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.black, fontSize: 20),
                ),
                style: Theme.of(context).outlinedButtonTheme.style.copyWith(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey;
                  } else {
                    return Colors.grey[350];
                  }
                }))),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpokenButton(BuildContext context, Map<String, String> map) {
    return DropdownButton(
      value: _chosenSpoken,
      isExpanded: true,
      focusColor: Colors.white,
      items: map.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _chosenSpoken = value;
        });
      },
      hint: Text('Spoken language'),
    );
  }

  Widget _buildLanguageButton(BuildContext context, Map<String, String> map) {
    return DropdownButton(
      isExpanded: true,
      value: _chosenLanguage,
      focusColor: Colors.white,
      items: map.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _chosenLanguage = value;
        });
      },
      hint: Text('Coding language'),
    );
  }

  Widget _buildDateButton(BuildContext context, Map<String, String> map) {
    return DropdownButton(
      value: _chosenDate,
      isExpanded: true,
      focusColor: Colors.white,
      items: map.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          _chosenDate = value;
        });
      },
      hint: Text('Duration'),
    );
  }
}
