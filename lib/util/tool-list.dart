import 'dart:convert';
import 'package:dev_tools/pages/base64/base64_converter.dart';
import 'package:dev_tools/pages/csv/csv_converter.dart';
import 'package:dev_tools/pages/json-validator/json-validator-page.dart';
import 'package:dev_tools/pages/number-base/base-converter-page.dart';
import 'package:dev_tools/pages/trend-scraper/trend-list-page.dart';
import 'package:dev_tools/pages/udp/receiver-page.dart';
import 'package:dev_tools/pages/udp/tab-page.dart';
import 'package:dev_tools/pages/uuid/uuid_tabpage.dart';
import 'package:flutter/material.dart';
import 'package:dev_tools/pages/iphone/homepage/devices_homepage.dart';
import 'package:dev_tools/pages/qrcode/qrtabs-page.dart';
import 'package:dev_tools/pages/dateTime/time_tabPage.dart';
import 'package:dev_tools/pages/urlprocessing/url-page.dart';
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
      TimeTabPage()),
  Tool(
      "Base64 Converter",
      Icon(
        Icons.compare_arrows,
        size: 65,
      ),
      Base64Converter()),
  Tool(
      "UUID Generator",
      Icon(
        Icons.data_saver_off,
        size: 65,
      ),
      UUIDConverter()),
  Tool(
      "URL encoder/decoder",
      Icon(
        Icons.link,
        size: 65,
      ),
      UrlPage()),
  Tool(
      "Number base converter",
      Icon(
        FontAwesome.calculator,
        size: 65,
      ),
      BaseConverterPage()),
  Tool(
      "Json to CSV Converter",
      Icon(
        FontAwesome.file_excel_o,
        size: 65,
      ),
      CSVConverter()),
  Tool(
      "JSON Validator",
      Icon(
        MaterialCommunityIcons.json,
        size: 65,
      ),
      JsonValidatorPage()),
];
