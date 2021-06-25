import 'package:dev_tools/pages/uuid/uuid_v1.dart';
import 'package:dev_tools/pages/uuid/uuid_v4.dart';
import 'package:dev_tools/pages/uuid/uuid_v5.dart';
import 'package:flutter/material.dart';

class UUIDConverter extends StatefulWidget {
  const UUIDConverter({Key key}) : super(key: key);

  @override
  _UUIDConverterState createState() => _UUIDConverterState();
}

class _UUIDConverterState extends State<UUIDConverter> {
  int _currentIndex = 0;
  PageController _pageController;

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
          "UUID Generator",
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
          children: <Widget>[UUIDV1(), UUIDV4(), UUIDV5()],
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
              icon: Icon(Icons.data_saver_off, size: 30),
              title: SizedBox(
                child: Text(
                  "V1",
                  style: TextStyle(fontSize: 13, height: 1.4),
                  textAlign: TextAlign.center,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_saver_off, size: 30),
              title: SizedBox(
                child: Text(
                  "V4",
                  style: TextStyle(fontSize: 13, height: 1.4),
                  textAlign: TextAlign.center,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.data_saver_off, size: 30),
              title: SizedBox(
                child: Text(
                  "V5",
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
