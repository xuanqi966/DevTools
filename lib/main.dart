import 'package:dev_tools/pages/dateTime/time_tabPage.dart';
import 'package:dev_tools/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dev_tools/pages/udp/tab-page.dart';
import 'pages/qrcode/qrtabs-page.dart';
import 'pages/trend-scraper/trend-list-page.dart';
import 'provider/RepoScraper.dart';
import 'provider/DevScraper.dart';
import 'pages/iphone/homepage/devices_homepage.dart';
import 'package:dev_tools/pages/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RepoScraper()),
        ChangeNotifierProvider(create: (context) => DevScraper())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DevTools',
        theme: basicTheme(),
        home: HomePage(),
        routes: {
          "/udp-messenger": (context) => TabPage(),
          "/device-data": (context) => DevicesHomePage(),
          "/qrcode": (context) => QrTabPage(),
          TrendListPage.routeName: (context) => TrendListPage(),
          "/time-converter": (context) => TimeTabPage(),
        },
      ),
    );
  }
}
