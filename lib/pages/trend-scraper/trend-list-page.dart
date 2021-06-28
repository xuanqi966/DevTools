import 'package:dev_tools/widgets/trend-filter-drawer.dart';
import 'package:dev_tools/widgets/dev-filter-drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/foundation.dart';
import '../../widgets/repo-list.dart';
import '../../widgets/dev-list.dart';

class TrendListPage extends StatefulWidget {
  static final routeName = '/trend-list';

  @override
  _TrendListPageState createState() => _TrendListPageState();
}

class _TrendListPageState extends State<TrendListPage> {
  bool _isShowingRepo = true;
  PageController _pageController;

  int _currIndex = 0;
  List<Object> _pages = [RepoList(), DevList()];
  List<Object> _drawers = [TrendFilterDrawer(), DevFilterDrawer()];

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          leading: IconButton(
            icon: defaultTargetPlatform == TargetPlatform.iOS
                ? Icon(Icons.arrow_back_ios)
                : Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      endDrawer: _drawers[_currIndex],
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currIndex = index);
          },
          children: <Widget>[RepoList(), DevList()],
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(MaterialCommunityIcons.source_repository_multiple,
                  size: 23),
              title: Text('Repositories', style: TextStyle(height: 1.5))),
          BottomNavigationBarItem(
              icon: Icon(
                Zocial.github,
                size: 25,
              ),
              title: Text('Developers', style: TextStyle(height: 1.8))),
        ],
      ),
    );
  }
}
