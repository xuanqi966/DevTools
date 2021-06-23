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
      appBar: AppBar(
        title: Text(
          titles[_currentIndex],
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_rounded, size: 30),
              title: SizedBox(
                child: Text(
                  "Encoder",
                  style: TextStyle(fontSize: 13, height: 1.4),
                  textAlign: TextAlign.center,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_rounded, size: 30),
              title: SizedBox(
                child: Text(
                  "Decoder",
                  style: TextStyle(fontSize: 13, height: 1.4),
                  textAlign: TextAlign.center,
                ),
              ))
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
