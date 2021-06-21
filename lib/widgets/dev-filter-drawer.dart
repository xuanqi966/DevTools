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
      child: Container(
        color: Colors.grey[300],
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Text(
                'Settings',
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(
                height: 20,
                color: Colors.grey[900],
              ),
              SizedBox(height: 10),
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
                  child: _buildLanguageButton(context, _languageMap)),
              SizedBox(height: 20),
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
                  child: _buildDateButton(context, _dateMap)),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: () {
                  devData.clearDevelopers();
                  devData.updateLanguage(_chosenLanguage);
                  devData.updateDateRange(_chosenDate);
                  devData.updateScraper();
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
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black;
                  } else {
                    return Colors.black87;
                  }
                })),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    devData.clearDevelopers();
                    devData.setDefaultFilter();
                    devData.updateScraper();
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
                      return Colors.grey[600];
                    } else {
                      return Colors.grey[400];
                    }
                  }))),
            ],
          ),
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
