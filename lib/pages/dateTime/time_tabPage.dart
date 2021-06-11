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
  List<Widget> _pages = [TimeConverter(), TimeStamp(), DateTimeToTS()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Time Converter",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: false,
        leadingWidth: 20,
        elevation: 2.0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: SizedBox(
                child: Text(
              "PST to \n SGT",
              style: TextStyle(fontSize: 12, height: 1.4),
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              title: SizedBox(
                child: Text(
                  "TimeStamp to DateTime",
                  style: TextStyle(fontSize: 12, height: 1.4),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back),
              title: SizedBox(
                child: Text(
                  "DateTime to TimeStamp",
                  style: TextStyle(fontSize: 12, height: 1.4),
                  maxLines: 2,
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
    });
  }
}
