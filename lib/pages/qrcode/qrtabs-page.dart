import 'package:flutter/material.dart';
import 'qr-scanner-page.dart';
import 'qr-generate-page.dart';

class QrTabPage extends StatefulWidget {
  @override
  _QrTabPageState createState() => _QrTabPageState();
}

class _QrTabPageState extends State<QrTabPage> {
  int _currIndex = 0;
  PageController _pageController;
  List<String> _pages = ["QR Code Scanner", "QR Code Generator"];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectPage(int index) {
    setState(() {
      _currIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          _pages[_currIndex],
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: false,
        leadingWidth: 20,
        elevation: 2.0,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currIndex = index);
          },
          children: <Widget>[QrScannerPage(), QrGeneratePage()],
        ),
      ),
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
