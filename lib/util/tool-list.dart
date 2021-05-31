import 'package:flutter/material.dart';

import '../models/tool.dart';

const TOOLS_LIST = const [
  Tool(
      "UDP Messenger",
      Icon(
        Icons.send,
        size: 50,
      ),
      "/udp-messenger"),
  Tool(
      "Apple Device Data",
      Icon(
        Icons.phone_iphone,
        size: 50,
      ),
      "/device-data"),
  Tool(
      "QR Code",
      Icon(
        Icons.qr_code_scanner,
        size: 50,
      ),
      "/qrcode")
];
