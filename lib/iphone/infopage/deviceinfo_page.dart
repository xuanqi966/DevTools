import 'package:flutter/material.dart';
import '../../models/device-attributes/iwidget.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/devices/device.dart';
import 'package:dev_tools/models/devices/display.dart';
import '../../models/device-attributes/safe-area.dart';

class DeviceInfoPage extends StatefulWidget {
  final String title;
  final String previousPage;
  final Display displayList;

  DeviceInfoPage({this.title, this.previousPage, this.displayList});

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
          children: [
            // give the tab bar a height
            _buildTabBar(),
            Divider(
              height: 40,
              thickness: 1.5,
            ),
            // tab bar view here
            _buildTabView(),
            //Spacer(),
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
          //first tab bar view widget
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildContainer(widget.displayList.properties.sublist(0, 2)),
                  _needBuildExpansionTile(
                      widget.displayList.properties.sublist(2)),
                  _buildModelColumn(widget.displayList.devices),
                  _buildSubColumn(widget.displayList.safeAreas, "Safe Area"),
                  _buildSubColumn(
                      widget.displayList.sizeClasses, "Size Classes"),
                  _buildSubColumn(widget.displayList.widgets, "Widgets"),
                ],
              ),
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

  Widget _buildSubColumn(List<dynamic> _propertyData, String title) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          _buildContainer(_propertyData),
        ]);
  }

  Widget _buildModelColumn(List<dynamic> _modelData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          "Models",
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          height: 160,
          width: double.infinity,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _modelData.length,
            itemBuilder: (context, index) {
              return _buildModelContainer(_modelData[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildModelContainer(Device _modelData) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        width: 120,
        child: Column(
          children: [
            Image.asset(
              "assets/iphone_images/${_modelData.imagePath}",
              height: 70,
              width: 70,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(_modelData.title,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 3.0,
            ),
            Text(_modelData.yearOfRelease,
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ));
  }

  Widget _needBuildExpansionTile(List<dynamic> _propertyData) {
    if (widget.previousPage == "Apple TV" || widget.previousPage == "CarPlay") {
      return SizedBox(
        height: 10,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey[300]),
            ),
            child: ExpansionTile(
              title: Text("Properties",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold)),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  color: Colors.grey[300],
                ),
                _buildListView(
                  _propertyData,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildContainer(List<dynamic> _propertyData) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[300]),
        ),
        child: _buildListView(_propertyData));
  }

  Widget _buildListView(List<dynamic> _propertyList) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1.0,
            color: Colors.grey[300],
          );
        },
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _propertyList.length,
        itemBuilder: (context, index) {
          return _buildRow(_propertyList[index]);
        });
  }

  Widget _buildRow(dynamic devicesPageIcon) {
    String title;
    String subtitle;

    if (devicesPageIcon.runtimeType == Property) {
      title = devicesPageIcon.propertyTitle;
      subtitle = devicesPageIcon.property1;
    } else if (devicesPageIcon.runtimeType == Safearea) {
      title = devicesPageIcon.title;
      subtitle = devicesPageIcon.dimension1x;
    } else if (devicesPageIcon.runtimeType == SizeClass) {
      title = devicesPageIcon.title;
      subtitle = devicesPageIcon.width;
    } else if (devicesPageIcon.runtimeType == Iwidget) {
      title = devicesPageIcon.size;
      subtitle = devicesPageIcon.dimension1x;
    }

    return ListTile(
      title: Text(title ?? "Hello",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle ?? "Hello",
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.grey[600])),
      dense: true,
      leading: devicesPageIcon.icon,
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
