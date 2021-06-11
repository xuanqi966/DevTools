import 'package:flutter/material.dart';
import 'qr-scanner-page.dart';
import 'qr-generate-page.dart';

class QrTabPage extends StatefulWidget {
  @override
  _QrTabPageState createState() => _QrTabPageState();
}

class _QrTabPageState extends State<QrTabPage> {
  int _currIndex = 0;
  List<Map<String, Object>> _pages = [
    {"title": "QR Code Scanner", "page": QrScannerPage()},
    {"title": "QR Code Generator", "page": QrGeneratePage()}
  ];

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
          _pages[_currIndex]["title"],
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: false,
        leadingWidth: 20,
        elevation: 2.0,
      ),
      body: _pages[_currIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            title: Text("Scanner"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code), title: Text("Generator"))
        ],
      ),
    );
  }
}
