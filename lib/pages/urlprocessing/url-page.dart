import 'package:flutter/material.dart';
import '../../widgets/url-processing/url-encoder.dart';
import '../../widgets/url-processing/url-decoder.dart';

class UrlPage extends StatefulWidget {
  @override
  _UrlPageState createState() => _UrlPageState();
}

class _UrlPageState extends State<UrlPage> {
  int _currIndex = 0;
  PageController _pageController;

  void _selectPage(int index) {
    setState(() {
      _currIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(30.0), child: AppBar()),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currIndex = index);
          },
          children: <Widget>[UrlEncoder(), UrlDecoder()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        unselectedFontSize: 11.0,
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currIndex,
        selectedLabelStyle: TextStyle(height: 1.8),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded, size: 30),
              label: "URL Encoder"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_rounded, size: 30),
              label: "URL Decoder"),
        ],
      ),
    );
  }
}
