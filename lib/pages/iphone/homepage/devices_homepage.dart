import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../homepage/homepage_icon.dart';
import '../displaypage/display_page.dart';
import '../util/data.dart';
import 'package:dev_tools/models/devices/display.dart';
import '../../../models/devices/device.dart';

class DevicesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Devices",
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: false,
        leadingWidth: 20,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: buildGridView(context),
      ),
    );
  }

  Widget buildGridView(BuildContext context) {
    List<HomePageIcon> _homePageIcons = homePageIconData;

    return GridView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      children: _homePageIcons
          .map((icon) => buildCard(
              context,
              icon.iconImageVal,
              icon.imageName,
              icon.nextPage,
              icon.devicesList,
              icon.displayList,
              icon.displayList2,
              icon.phonesList))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, crossAxisSpacing: 20, mainAxisSpacing: 20),
    );
  }

  Widget buildCard(
      BuildContext context,
      String imageName,
      String title,
      String nextPage,
      List<Device> devicesList,
      Map<int, List<Display>> displayList,
      Map<int, List<Display>> displayList2,
      Map<String, Device> phonesList) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: Duration(milliseconds: 400),
        closedElevation: 0,
        closedColor: Colors.white,
        openBuilder: (context, _) {
          return new DisplayPage(
            title: "$title",
            devicesList: devicesList,
            displayList: displayList,
            phonesList: phonesList,
            displayList2: displayList2,
          );
        },
        closedBuilder: (context, openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.grey[300],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "$imageName",
                      height: 80,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("$title",
                        style: Theme.of(context).textTheme.bodyText1),
                  ]),
            ),
          );
        });
  }
}
