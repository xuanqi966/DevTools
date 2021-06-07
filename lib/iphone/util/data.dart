import 'package:dev_tools/iphone/util/carplay-data.dart';
import 'package:dev_tools/iphone/util/ipod-data.dart';
import 'package:dev_tools/iphone/util/tv-data.dart';
import 'package:dev_tools/iphone/util/watch-data.dart';
import '../homepage/homepage_icon.dart';
import 'iphone-data.dart';
import 'ipad-data.dart';
import 'package:flutter/material.dart';
import '../../models/devices/device.dart';

final homePageIconData = [
  HomePageIcon(
      imageName: "iPhone",
      iconImageVal: "assets/iphone_images/iphone_icon.png",
      nextPage: "/iphone_page",
      devicesList: iphoneDevicesPageIconData,
      displayList: displays,
      phonesList: iphones,
      displayList2: displays2),
  HomePageIcon(
      imageName: "iPad",
      iconImageVal: "assets/iphone_images/ipad_icon.png",
      nextPage: "/ipad_page",
      devicesList: ipadDevicesPageIconData,
      displayList: ipadDisplays,
      phonesList: ipads,
      displayList2: ipadDisplays2),
  HomePageIcon(
      imageName: "iPod Touch",
      iconImageVal: "assets/iphone_images/ipod_icon.png",
      nextPage: "/ipod_page",
      devicesList: ipodDevicesPageIconData,
      displayList: ipodDisplays,
      phonesList: ipods,
      displayList2: ipodDisplays2),
  HomePageIcon(
      imageName: "Apple Watch",
      iconImageVal: "assets/iphone_images/apple_watch_icon.png",
      nextPage: "/applewatch_page",
      devicesList: watchDevicesPageIconData,
      displayList: watchDisplays,
      phonesList: watches,
      displayList2: watchDisplays2),
  HomePageIcon(
      imageName: "Apple TV",
      iconImageVal: "assets/iphone_images/apple_tv_icon.png",
      nextPage: "/appletv_page",
      devicesList: appleTVDevicesPageIconData,
      displayList: tvDisplays,
      phonesList: tvs,
      displayList2: tvDisplays2),
  HomePageIcon(
      imageName: "CarPlay",
      iconImageVal: "assets/iphone_images/car_icon.png",
      nextPage: "/carplay_page",
      devicesList: carplayDevicesPageIconData,
      displayList: carplayDisplays,
      phonesList: null)
];

final iphoneDevicesPageIconData = [
  Device("6.7\"", "1 Model", "assets/iphone_images/iphone_new.png"),
  Device("6.5\" XDR", "1 Model", "assets/iphone_images/iphone_new.png"),
  Device("6.5\"", "1 Model", "assets/iphone_images/iphone_new.png"),
  Device(
      "6.1\" Super Retina", "2 Models", "assets/iphone_images/iphone_new.png"),
  Device(
      "6.1\" Liquid Retina", "2 Models", "assets/iphone_images/iphone_new.png"),
  Device("5.8\" XDR", "1 Model", "assets/iphone_images/iphone_new.png"),
  Device("5.8\"", "2 Models", "assets/iphone_images/iphone_new.png"),
  Device("5.5\" Display P3", "2 Models", "assets/iphone_images/iphone_old.png"),
  Device("5.5\"", "2 Models", "assets/iphone_images/iphone_old.png"),
  Device("5.4\"", "1 Model", "assets/iphone_images/iphone_new.png"),
  Device("4.7\" Dsplay P3", "3 Models", "assets/iphone_images/iphone_old.png"),
  Device("4.7\"", "2 Models", "assets/iphone_images/iphone_old.png"),
  Device("4\"", "4 Models", "assets/iphone_images/iphone_old.png"),
  Device("3.5\" Retina", "2 Models", "assets/iphone_images/iphone_old.png"),
  Device("3.5\"", "3 Models", "assets/iphone_images/iphone_old.png"),
];

final ipadDevicesPageIconData = [
  Device("12.9\" XDR", "1 Model", "assets/iphone_images/ipad_new.png"),
  Device(
      "12.9\" Liquid Retina", "2 Models", "assets/iphone_images/ipad_new.png"),
  Device("12.9\" Display P3", "1 Model", "assets/iphone_images/ipad_old.png"),
  Device("12.9\" Super Retina", "1 Model", "assets/iphone_images/ipad_old.png"),
  Device("11\"", "3 Models", "assets/iphone_images/ipad_new.png"),
  Device("10.9\"", "1 Model", "assets/iphone_images/ipad_new.png"),
  Device("10.5\"", "2 Models", "assets/iphone_images/ipad_old.png"),
  Device("10.2\"", "2 Models", "assets/iphone_images/ipad_old.png"),
  Device("9.7\" Pro", "1 Model", "assets/iphone_images/ipad_old.png"),
  Device("9.7\" Air", "4 Models", "assets/iphone_images/ipad_old.png"),
  Device("9.7\" Retina", "2 Models", "assets/iphone_images/ipad_thick.png"),
  Device("9.7\"", "2 Models", "assets/iphone_images/ipad_thick.png"),
  Device("7.9\" Display P3", "1 Model", "assets/iphone_images/ipad_old.png"),
  Device("7.9\" Retina", "3 Models", "assets/iphone_images/ipad_old.png"),
  Device("7.9\"", "1 Model", "assets/iphone_images/ipad_old.png"),
];

final ipodDevicesPageIconData = [
  Device("4\"", "3 Models", "assets/iphone_images/iphone_old.png"),
  Device("3.5\" Retina", "1 Model", "assets/iphone_images/iphone_old.png"),
  Device("3.5\"", "3 Models", "assets/iphone_images/iphone_old.png"),
];

final watchDevicesPageIconData = [
  Device("44mm", "4 Models", "assets/iphone_images/watch_thin.png"),
  Device("42mm", "4 Models", "assets/iphone_images/watch_thick.png"),
  Device("40mm", "4 Models", "assets/iphone_images/watch_thin.png"),
  Device("38mm", "4 Models", "assets/iphone_images/watch_thick.png"),
];

final appleTVDevicesPageIconData = [
  Device("4K", "2 Models", "assets/iphone_images/tv_new.png"),
  Device("HD", "1 Model", "assets/iphone_images/tv_new.png"),
];

final carplayDevicesPageIconData = [
  Device("8:3", "24 Models", "assets/iphone_images/eightThree.png"),
  Device("16:9 HD", "24 Models", "assets/iphone_images/sixteenNine.png"),
  Device("16:9", "24 Models", "assets/iphone_images/sixteenNine.png"),
  Device("5:3", "24 Models", "assets/iphone_images/fiveThree.png"),
];

Map<String, Image> icons = {
  'contrast': Image.asset(
    'assets/icons/contrastRatio.png',
    width: 30,
    height: 30,
  ),
  'earSize': Image.asset(
    'assets/icons/earSize.png',
    width: 30,
    height: 30,
  ),
  'ios': Image.asset(
    'assets/icons/ios.png',
    width: 30,
    height: 30,
  ),
  'landscape': Image.asset(
    'assets/icons/landscape.png',
    width: 30,
    height: 30,
  ),
  'landscapeHomeIndicator': Image.asset(
    'assets/icons/landscapeHomeIndicator.png',
    width: 30,
    height: 30,
  ),
  'landscapeStatusBar': Image.asset(
    'assets/icons/landscapeStatusBar.png',
    width: 30,
    height: 30,
  ),
  'large': Image.asset(
    'assets/icons/large.png',
    width: 30,
    height: 30,
  ),
  'medium': Image.asset(
    'assets/icons/medium.png',
    width: 30,
    height: 30,
  ),
  'notchSize': Image.asset(
    'assets/icons/notchSize.png',
    width: 30,
    height: 30,
  ),
  'portrait': Image.asset(
    'assets/icons/portrait.png',
    width: 30,
    height: 30,
  ),
  'portraitHomeIndicator': Image.asset(
    'assets/icons/portraitHomeIndicator.png',
    width: 30,
    height: 30,
  ),
  'portraitStatusBar': Image.asset(
    'assets/icons/portraitStatusBar.png',
    width: 30,
    height: 30,
  ),
  'ppi': Image.asset(
    'assets/icons/ppi.png',
    width: 30,
    height: 30,
  ),
  'resolution': Image.asset(
    'assets/icons/resolution.png',
    width: 30,
    height: 30,
  ),
  'small': Image.asset(
    'assets/icons/small.png',
    width: 30,
    height: 30,
  ),
  'trueTone': Image.asset(
    'assets/icons/trueTone.png',
    width: 30,
    height: 30,
  ),
  'aspectRatio': Image.asset(
    'assets/icons/aspectRatio.png',
    width: 30,
    height: 30,
  ),
  'display': Image.asset(
    'assets/icons/display.png',
    width: 30,
    height: 30,
  ),
  'halfLandscapeSplit': Image.asset(
    'assets/icons/halfLandscapeSplit.png',
    width: 30,
    height: 30,
  ),
  'ipadOS': Image.asset(
    'assets/icons/ipadOS.png',
    width: 30,
    height: 30,
  ),
  'landscapeSplideOver': Image.asset(
    'assets/icons/landscapeSplideOver.png',
    width: 30,
    height: 30,
  ),
  'oneThirdLandscapeSplit': Image.asset(
    'assets/icons/oneThirdLandscapeSplit.png',
    width: 30,
    height: 30,
  ),
  'oneThirdPortraitSplit': Image.asset(
    'assets/icons/oneThirdPortraitSplit.png',
    width: 30,
    height: 30,
  ),
  'portraitSlideOver': Image.asset(
    'assets/icons/portraitSlideOver.png',
    width: 30,
    height: 30,
  ),
  'twoThirdLandscapeSplit': Image.asset(
    'assets/icons/twoThirdLandscapeSplit.png',
    width: 30,
    height: 30,
  ),
  'twoThirdPortraitSplit': Image.asset(
    'assets/icons/twoThirdPortraitSplit.png',
    width: 30,
    height: 30,
  ),
  'rightOverScan': Image.asset(
    'assets/icons/rightOverScan.png',
    width: 30,
    height: 30,
  ),
};
