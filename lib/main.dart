import 'package:dev_tools/pages/home-page.dart';
import 'package:dev_tools/util/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', theme: basicTheme(), home: HomePage(),
      // routes: {
      //   "/udp-messenger": (context) => udpPage(),
      //   "/device-data": (context) => DeviceDataPage(),
      //   "/qrcode": (context) => QrcodePage()
      // },
    );
  }
}
