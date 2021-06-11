import 'package:dev_tools/pages/home-page.dart';
import 'package:dev_tools/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dev_tools/pages/udp/tab-page.dart';
import 'pages/qrcode/qrtabs-page.dart';
import 'pages/trend-scraper/trend-list-page.dart';
import 'iphone/homepage/devices_homepage.dart';
import './provider/TrendScraper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          final scraper = TrendScraper();
          scraper.setAddress('https://github.com/trending');
          return scraper;
        })
      ],
      child: MaterialApp(
        title: 'DevTools',
        theme: basicTheme(),
        home: HomePage(),
        routes: {
          "/udp-messenger": (context) => TabPage(),
          "/device-data": (context) => DevicesHomePage(),
          "/qrcode": (context) => QrTabPage(),
          TrendListPage.routeName: (context) => TrendListPage()
        },
      ),
    );
  }
}
