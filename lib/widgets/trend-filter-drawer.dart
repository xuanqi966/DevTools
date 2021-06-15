import 'package:flutter/material.dart';
import 'package:dev_tools/provider/TrendScraper.dart';
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
    final repoData = Provider.of<TrendScraper>(context, listen: false);
    _chosenSpoken = repoData.getSpoken();
    _chosenLanguage = repoData.getLanguage();
    _chosenDate = repoData.getDate();

    spokenMap = repoData.getSpokenMap();
    languageMap = repoData.getLanMap();
    dateMap = repoData.getDateMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final repoData = Provider.of<TrendScraper>(context, listen: false);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Spoken Language',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildSpokenButton(context, repoData.getSpokenMap()),
            SizedBox(
              height: 30,
            ),
            Text(
              'Language',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildLanguageButton(context, repoData.getLanMap()),
            SizedBox(
              height: 30,
            ),
            Text(
              'Date Range',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildDateButton(context, repoData.getDateMap()),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
                onPressed: () {
                  repoData.updateSpoken(_chosenSpoken);
                  repoData.updateLanguage(_chosenLanguage);
                  repoData.updateDate(_chosenDate);
                  repoData.loadAddress();
                  Navigator.of(context).pop();
                },
                child: Text("Confirm"))
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
