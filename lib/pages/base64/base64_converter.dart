import 'package:flutter/material.dart';
import 'base64_decoder.dart';
import 'base64_encoder.dart';

class Base64Converter extends StatefulWidget {
  const Base64Converter({Key key}) : super(key: key);

  @override
  _Base64ConverterState createState() => _Base64ConverterState();
}

class _Base64ConverterState extends State<Base64Converter> {
  int _currentIndex = 0;
  PageController _pageController;
  List<String> titles = ["Base64 Encoder", "Base64 Decoder"];

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
            setState(() => _currentIndex = index);
          },
          children: <Widget>[Encoder(), Decoder()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(fontSize: 13, height: 1.4),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded, size: 30),
            label: "Encoder",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_rounded, size: 30),
            label: "Decoder",
          )
        ],
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}
