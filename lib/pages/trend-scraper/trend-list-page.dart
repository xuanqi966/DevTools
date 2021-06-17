import 'package:dev_tools/widgets/trend-filter-drawer.dart';
import 'package:dev_tools/widgets/dev-filter-drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../widgets/repo-list.dart';
import '../../widgets/dev-list.dart';

class TrendListPage extends StatefulWidget {
  static final routeName = '/trend-list';

  @override
  _TrendListPageState createState() => _TrendListPageState();
}

class _TrendListPageState extends State<TrendListPage> {
  bool _isShowingRepo = true;

  int _currIndex = 0;
  List<Object> _pages = [RepoList(), DevList()];
  List<Object> _drawers = [TrendFilterDrawer(), DevFilterDrawer()];

  void _selectPage(int index) {
    setState(() {
      _currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GitHub Trending",
          style: Theme.of(context).textTheme.headline1,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      endDrawer: _drawers[_currIndex],
      body: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_pages[_currIndex]],
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
              icon: Icon(MaterialCommunityIcons.source_repository_multiple),
              title: Text('Repositories')),
          BottomNavigationBarItem(
              icon: Icon(Zocial.github), title: Text('Developers')),
        ],
      ),
    );
  }
}
