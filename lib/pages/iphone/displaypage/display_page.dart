import 'package:flutter/material.dart';
import '../../../models/devices/device.dart';
import '../infopage/deviceinfo_page.dart';
import 'package:dev_tools/models/devices/display.dart';

class DisplayPage extends StatefulWidget {
  final String title;
  final List<Device> devicesList;
  final Map<int, List<Display>> displayList;
  final Map<String, Device> phonesList;
  final Map<int, List<Display>> displayList2;

  DisplayPage(
      {this.title,
      this.devicesList,
      this.displayList,
      this.phonesList,
      this.displayList2});

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
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(33.0), child: AppBar()),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(widget.title,
                  style: Theme.of(context).textTheme.headline1),
            ),
            // give the tab bar a height
            _buildTabBar(),
            _buildDivider(),
            // tab bar view here
            _buildTabView(),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    if (widget.phonesList == null) {
      return SizedBox.shrink();
    } else {
      return Divider(
        height: 40,
        thickness: 1.5,
      );
    }
  }

  Widget _buildTabView() {
    if (widget.phonesList == null) {
      return Expanded(
          child: _buildListView(widget.devicesList, widget.displayList, true));
    } else {
      List<Device> _devicesList2 = [];
      widget.phonesList.forEach((key, value) => _devicesList2
          .add(Device(value.title, value.yearOfRelease, value.imagePath)));
      return Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildListView(widget.devicesList, widget.displayList, true),
            _buildListView(_devicesList2, widget.displayList2, false),
          ],
        ),
      );
    }
  }

  Padding _buildListView(List<Device> devicesList,
      Map<int, List<Display>> displayList, bool needModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Divider(
                thickness: 1.0,
              ),
            );
          },
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 16.0),
          itemCount: devicesList.length,
          itemBuilder: (context, i) {
            return _buildRow(
                devicesList[i], i, devicesList, displayList, needModel);
          }),
    );
  }

  Widget _buildRow(Device devicesPageIcon, int index, List<Device> devicesList,
      Map<int, List<Display>> displayList, bool needModel) {
    BorderRadius _findBorderRadius() {
      if (index == 0) {
        return BorderRadius.only(
            topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0));
      } else if (index == devicesList.length - 1) {
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
          title: Text(devicesPageIcon.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.bold)),
          subtitle: Text(devicesPageIcon.yearOfRelease,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey[600])),
          dense: true,
          leading: Image.asset("${devicesPageIcon.imagePath}"),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
          onTap: () {
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DeviceInfoPage(
                title: devicesPageIcon.title,
                previousPage: widget.title,
                displayList: displayList[index],
                needModel: needModel,
              ),
            ));
          },
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    if (widget.phonesList == null) {
      return SizedBox(
        height: 10,
      );
    } else {
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
}
