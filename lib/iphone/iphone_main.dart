import 'package:flutter/material.dart';
import 'package:flutter_searchbar/homepage/devices_homepage.dart';
import 'package:flutter_searchbar/util/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: basicTheme(),
      home: DevicesHomePage(),
    );
  }
}
