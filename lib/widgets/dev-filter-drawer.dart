import 'package:flutter/material.dart';
import 'package:dev_tools/provider/DevScraper.dart';
import 'package:provider/provider.dart';

class DevFilterDrawer extends StatefulWidget {
  @override
  _DevFilterDrawerState createState() => _DevFilterDrawerState();
}

class _DevFilterDrawerState extends State<DevFilterDrawer> {
  String _chosenLanguage;
  String _chosenDate;

  Map<String, String> _languageMap;
  Map<String, String> _dateMap;

  @override
  void initState() {
    final devData = Provider.of<DevScraper>(context, listen: false);
    _chosenLanguage = devData.getLanguage;
    _chosenDate = devData.getDateRange;

    _languageMap = devData.getLanguageMap;
    _dateMap = devData.getDateRangeMap;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final devData = Provider.of<DevScraper>(context, listen: false);
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
              'Language',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildLanguageButton(context, _languageMap),
            SizedBox(
              height: 30,
            ),
            Text(
              'Date Range',
              style: Theme.of(context).textTheme.headline3,
            ),
            _buildDateButton(context, _dateMap),
            SizedBox(
              height: 50,
            ),
            OutlinedButton(
                onPressed: () {
                  devData.clearDevelopers();
                  devData.updateLanguage(_chosenLanguage);
                  devData.updateDateRange(_chosenDate);
                  devData.updateScraper();
                  Navigator.of(context).pop();
                },
                child: Text("Confirm"))
          ],
        ),
      ),
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
      hint: Text('Date Range'),
    );
  }
}
