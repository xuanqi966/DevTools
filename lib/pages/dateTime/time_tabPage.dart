import 'package:dev_tools/pages/dateTime/timeStamp/dateTime_to_TS.dart';
import 'package:dev_tools/pages/dateTime/timezone/PST_To_SGT.dart';
import 'package:dev_tools/pages/dateTime/timeStamp/timestamp_converter.dart';
import 'package:flutter/material.dart';

class TimeTabPage extends StatefulWidget {
  const TimeTabPage({Key key}) : super(key: key);

  @override
  _TimeTabPageState createState() => _TimeTabPageState();
}

class _TimeTabPageState extends State<TimeTabPage> {
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
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(30.0), child: AppBar()),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[TimeConverter(), TimeStamp(), DateTimeToTS()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(fontSize: 12, height: 1.4),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "PST to SGT"),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: "TS to DT",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: "DT to TS",
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
