import 'package:flutter/material.dart';
import 'package:flutter_searchbar/homepage/homepage_icon.dart';
import 'package:flutter_searchbar/displaypage/display_page.dart';
import 'package:flutter_searchbar/util/data.dart';
import 'package:flutter_searchbar/displaypage/devicespage_icon.dart';

class DevicesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Devices",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: buildGridView(context),
      ),
    );
  }

  Widget buildGridView(BuildContext context) {
    List<HomePageIcon> _homePageIcons = homePageIconData;

    return GridView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      children: _homePageIcons
          .map((icon) => buildCard(context, icon.iconImageVal, icon.imageName,
              icon.nextPage, icon.devicesList))
          .toList(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
    );
  }

  Widget buildCard(BuildContext context, String imageName, String title,
      String nextPage, List<DevicesIcon> devicesList) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new DisplayPage(
                  title: "$title",
                  devicesList: devicesList,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.grey[300],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/$imageName",
                height: 80,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("$title", style: Theme.of(context).textTheme.bodyText1),
            ]),
      ),
    );
  }
}
