import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../models/tool.dart';

const TOOLS_LIST = const [
  Tool(
      "UDP Messenger",
      Icon(
        Icons.send,
        size: 65,
      ),
      "/udp-messenger"),
  Tool(
      "Apple Devices",
      Icon(
        FontAwesome.apple,
        size: 65,
      ),
      "/device-data"),
  Tool(
      "QR Code",
      Icon(
        Icons.qr_code_scanner,
        size: 65,
      ),
      "/qrcode"),
  Tool(
      "Trendy Repos",
      Icon(
        FontAwesome.github,
        size: 50,
      ),
      "/trend-list"),
  Tool(
      "Time Converter",
      Icon(
        Icons.access_time,
        size: 65,
      ),
      "/time-converter")
];
