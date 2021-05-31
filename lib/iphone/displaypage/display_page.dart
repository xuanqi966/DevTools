import 'package:flutter/material.dart';
import 'package:flutter_searchbar/displaypage/devicespage_icon.dart';
import 'package:flutter_searchbar/infopage/deviceinfo_page.dart';

class DisplayPage extends StatefulWidget {
  final String title;
  final List<DevicesIcon> devicesList;

  DisplayPage({this.title, this.devicesList});

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage>
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
          children: [
            // give the tab bar a height
            _buildTabBar(),
            Divider(
              height: 40,
              thickness: 1.5,
            ),
            // tab bar view here
            _buildTabView(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Ink(
                    color: Colors.grey[200],
                    child: Divider(
                      thickness: 1.0,
                    ),
                  );
                },
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 16.0),
                itemCount: widget.devicesList.length,
                itemBuilder: (context, i) {
                  return _buildRow(widget.devicesList[i], i);
                }),
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

  Widget _buildRow(DevicesIcon devicesPageIcon, int index) {
    BorderRadius _findBorderRadius() {
      if (index == 0) {
        return BorderRadius.only(
            topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0));
      } else if (index == widget.devicesList.length - 1) {
        return BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0));
      } else {
        return BorderRadius.zero;
      }
    }

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: _findBorderRadius(),
      ),
      child: Center(
        child: ListTile(
          title: Text(devicesPageIcon.imageName,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text(devicesPageIcon.subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey[600])),
          dense: true,
          leading: Image.asset("assets/${devicesPageIcon.iconImageVal}"),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DeviceInfoPage(
                      title: devicesPageIcon.imageName,
                    )));
          },
        ),
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
              text: 'Displays',
            ),
            Tab(
              text: 'Models',
            ),
          ],
        ),
      ),
    );
  }
}
