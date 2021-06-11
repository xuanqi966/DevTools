import 'package:flutter/material.dart';
import 'sender-page.dart';
import 'receiver-page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [SenderPage(), ReceiverPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "UDP Messenger",
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
            icon: Icon(Icons.send),
            title: Text("Send"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.email), title: Text("Receive"))
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
