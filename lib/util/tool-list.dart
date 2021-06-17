import 'package:dev_tools/pages/trend-scraper/trend-list-page.dart';
import 'package:dev_tools/pages/udp/receiver-page.dart';
import 'package:dev_tools/pages/udp/tab-page.dart';
import 'package:flutter/material.dart';
import 'package:dev_tools/pages/iphone/homepage/devices_homepage.dart';
import 'package:dev_tools/pages/qrcode/qrtabs-page.dart';
import 'package:dev_tools/pages/dateTime/time_tabPage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../models/tool.dart';

final TOOLS_LIST = [
  Tool(
      "UDP Messenger",
      Icon(
        Icons.send,
        size: 65,
      ),
      ReceiverPage()),
  Tool(
      "Apple Devices",
      Icon(
        FontAwesome.apple,
        size: 65,
      ),
      DevicesHomePage()),
  Tool(
      "QR Code",
      Icon(
        Icons.qr_code_scanner,
        size: 65,
      ),
      QrTabPage()),
  Tool(
      "Trendy Repos",
      Icon(
        FontAwesome.github,
        size: 50,
      ),
      TrendListPage()),
  Tool(
      "Time Converter",
      Icon(
        Icons.access_time,
        size: 65,
      ),
      TimeTabPage())
];
