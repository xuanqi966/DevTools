import 'package:dev_tools/pages/json-validator/json-format-page.dart';
import 'package:dev_tools/pages/json-validator/json-validator-page.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  int _currIndex = 0;
  List<Object> _pages = [JsonValidatorPage(), JsonFormatPage()];

  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "JSON",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _pages[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        unselectedFontSize: 11.0,
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currIndex,
        selectedLabelStyle: TextStyle(height: 1.8),
        items: [
          BottomNavigationBarItem(
            icon: Icon(MaterialCommunityIcons.json, size: 23),
            label: "Validator",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.format_align_right,
                size: 25,
              ),
              label: "Formatter"),
        ],
      ),
    );
  }
}
