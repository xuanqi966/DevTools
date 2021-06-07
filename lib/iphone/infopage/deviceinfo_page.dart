import 'package:dev_tools/models/device-attributes/multitasking.dart';
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
  final List<Display> displayList;
  final bool needModel;

  DeviceInfoPage(
      {this.title, this.previousPage, this.displayList, this.needModel});

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
            _needBuildTabBar(),
            _needBuildDivider(),
            // tab bar view here
            _needBuildTabView(),
            //Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _needBuildDivider() {
    if (widget.displayList[1] == null) {
      return SizedBox.shrink();
    } else {
      return Divider(
        height: 40,
        thickness: 1.5,
      );
    }
  }

  Widget _needBuildTabView() {
    if (widget.displayList[1] == null) {
      return Expanded(child: _buildSubTabView(widget.displayList[0]));
    } else {
      return Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            //first tab bar view widget
            _buildSubTabView(widget.displayList[0]),
            // second tab bar view widget
            _buildSubTabView(widget.displayList[1]),
          ],
        ),
      );
    }
  }

  Widget _buildSubTabView(Display displayList) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContainer(displayList.properties.sublist(0, 2)),
            _needBuildExpansionTile(displayList.properties.sublist(2)),
            _buildModelColumn(displayList.devices),
            _buildSubColumn(displayList.safeAreas, "Safe Areas"),
            _needBuildMultiSubColumn(displayList),
            _buildSubColumn(displayList.sizeClasses, "Size Classes"),
            _buildSubColumn(displayList.widgets, "Widgets"),
          ],
        ),
      ),
    );
  }

  Widget _needBuildMultiSubColumn(Display display) {
    if (widget.previousPage == "iPad") {
      return _buildSubColumn(display.multitaskings, "Multitaskings");
    } else {
      return SizedBox.shrink();
    }
  }

  Widget _buildSubColumn(List<dynamic> _propertyData, String title) {
    if (_propertyData.length == 0) {
      return SizedBox.shrink();
    } else {
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
  }

  Widget _buildModelColumn(List<dynamic> _modelData) {
    String title;

    if (widget.previousPage == "CarPlay") {
      title = "Supported on";
    } else {
      title = "Models";
    }

    if (widget.needModel == false) {
      return SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            title,
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
  }

  Widget _buildModelContainer(Device _modelData) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        width: 120,
        child: Column(
          children: [
            Image.asset(
              "${_modelData.imagePath}",
              height: 70,
              width: 70,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(_modelData.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 10)),
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
    String dimensionOne = "@1x: ";
    String dimensionTwo;

    if (widget.previousPage == "iPhone") {
      dimensionTwo = "@3x: ";
    } else {
      dimensionTwo = "@2x: ";
    }

    if (devicesPageIcon.runtimeType == Property) {
      title = devicesPageIcon.propertyTitle;
      if (title == "Resolution") {
        subtitle = dimensionOne + devicesPageIcon.property1;
        if (devicesPageIcon.property2 != null) {
          subtitle =
              subtitle + "         " + dimensionTwo + devicesPageIcon.property2;
        }
      } else {
        subtitle = devicesPageIcon.property1;
      }
    } else if (devicesPageIcon.runtimeType == Safearea) {
      title = devicesPageIcon.title;
      subtitle = "@1x: " + devicesPageIcon.dimension1x;
      if (devicesPageIcon.dimension3x != null) {
        subtitle =
            subtitle + "         " + dimensionTwo + devicesPageIcon.dimension3x;
      }
    } else if (devicesPageIcon.runtimeType == SizeClass) {
      title = devicesPageIcon.title;
      subtitle = "Width: " +
          devicesPageIcon.width +
          "         Height: " +
          devicesPageIcon.height;
    } else if (devicesPageIcon.runtimeType == Iwidget) {
      title = devicesPageIcon.size;
      subtitle = "@1x: " + devicesPageIcon.dimension1x;
      if (devicesPageIcon.dimension3x != null) {
        subtitle =
            subtitle + "         " + dimensionTwo + devicesPageIcon.dimension3x;
      }
    } else if (devicesPageIcon.runtimeType == Multitasking) {
      title = devicesPageIcon.title;
      subtitle = "@1x: " + devicesPageIcon.dimension1x;
      if (devicesPageIcon.dimension2x != null) {
        subtitle =
            subtitle + "         " + dimensionTwo + devicesPageIcon.dimension2x;
      }
    }

    return ListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: Colors.grey[800])),
      dense: true,
      leading: devicesPageIcon.icon,
    );
  }

  Widget _needBuildTabBar() {
    if (widget.displayList[1] == null) {
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
}
