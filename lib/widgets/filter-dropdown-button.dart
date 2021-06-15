import 'package:dev_tools/provider/TrendScraper.dart';
import 'package:flutter/material.dart';

class FilterDropDownButton extends StatelessWidget {
  final _onUpdateHandler;
  Map<String, String> map;

  FilterDropDownButton(this._onUpdateHandler, this.map);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      focusColor: Colors.white,
      items: map.keys.toList().map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String value) {
        _onUpdateHandler(context, value);
        print(value);
      },
      hint: Text('Spoken language'),
    );
  }
}
