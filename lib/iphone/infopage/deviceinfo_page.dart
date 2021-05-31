import 'package:flutter/material.dart';
import 'package:flutter_searchbar/infopage/properties.dart';
import 'package:flutter_searchbar/util/data.dart';

class DeviceInfoPage extends StatefulWidget {
  final String title;

  DeviceInfoPage({this.title});

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: false,
        leadingWidth: 20,
      ),
      body: SafeArea(
        //bottom: false,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            // give the tab bar a height
            _buildTabBar(),
            Divider(
              height: 40,
              thickness: 1.5,
            ),
            // tab bar view here
            _buildTabView(),
            _buildTabView(),
            //Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Container(
      height: 100,
      child: TabBarView(
        controller: _tabController,
        children: [
          //first tab bar view widget
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              height: 100,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    10.0,
                  )),
              child: Text("Hello"),
            ),
          ),

          // second tab bar view widget
          Center(
            child: Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            border: Border.all(color: Colors.grey[350], width: 1.5)),
        child: TabBar(
          controller: _tabController,
          // give the indicator a decoration (color and border radius)
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            color: Colors.grey[300],
          ),
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: 'Standard',
            ),
            Tab(
              text: 'Zoomed',
            ),
          ],
        ),
      ),
    );
  }
}
