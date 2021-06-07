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
      iconImageVal: "iphone_icon.png",
      nextPage: "/iphone_page",
      devicesList: iphoneDevicesPageIconData,
      displayList: displays,
      phonesList: iphones,
      displayList2: displays2),
  HomePageIcon(
      imageName: "iPad",
      iconImageVal: "ipad_icon.png",
      nextPage: "/ipad_page",
      devicesList: ipadDevicesPageIconData,
      displayList: ipadDisplays,
      phonesList: ipads,
      displayList2: ipadDisplays2),
  HomePageIcon(
      imageName: "iPod Touch",
      iconImageVal: "ipod_icon.png",
      nextPage: "/ipod_page",
      devicesList: ipodDevicesPageIconData,
      displayList: ipodDisplays,
      phonesList: ipods,
      displayList2: ipodDisplays2),
  HomePageIcon(
      imageName: "Apple Watch",
      iconImageVal: "apple_watch_icon.png",
      nextPage: "/applewatch_page",
      devicesList: watchDevicesPageIconData,
      displayList: watchDisplays,
      phonesList: watches,
      displayList2: watchDisplays2),
  HomePageIcon(
      imageName: "Apple TV",
      iconImageVal: "apple_tv_icon.png",
      nextPage: "/appletv_page",
      devicesList: appleTVDevicesPageIconData,
      displayList: tvDisplays,
      phonesList: tvs,
      displayList2: tvDisplays2),
  HomePageIcon(
      imageName: "CarPlay",
      iconImageVal: "car_icon.png",
      nextPage: "/carplay_page",
      devicesList: carplayDevicesPageIconData,
      displayList: carplayDisplays,
      phonesList: null)
];

final iphoneDevicesPageIconData = [
  Device("6.7\"", "1 Model", "iphone_new.png"),
  Device("6.5\" XDR", "1 Model", "iphone_new.png"),
  Device("6.5\"", "1 Model", "iphone_new.png"),
  Device("6.1\" Super Retina", "2 Models", "iphone_new.png"),
  Device("6.1\" Liquid Retina", "2 Models", "iphone_new.png"),
  Device("5.8\" XDR", "1 Model", "iphone_new.png"),
  Device("5.8\"", "2 Models", "iphone_new.png"),
  Device("5.5\" Display P3", "2 Models", "iphone_old.png"),
  Device("5.5\"", "2 Models", "iphone_old.png"),
  Device("5.4\"", "1 Model", "iphone_new.png"),
  Device("4.7\" Dsplay P3", "3 Models", "iphone_old.png"),
  Device("4.7\"", "2 Models", "iphone_old.png"),
  Device("4\"", "4 Models", "iphone_old.png"),
  Device("3.5\" Retina", "2 Models", "iphone_old.png"),
  Device("3.5\"", "3 Models", "iphone_old.png"),
];

final ipadDevicesPageIconData = [
  Device("12.9\" XDR", "1 Model", "iphone_new.png"),
  Device("12.9\" Liquid Retina", "2 Models", "iphone_new.png"),
  Device("12.9\" Display P3", "1 Model", "iphone_new.png"),
  Device("12.9\" Super Retina", "1 Model", "iphone_new.png"),
  Device("11\"", "3 Models", "iphone_new.png"),
  Device("10.9\"", "1 Model", "iphone_new.png"),
  Device("10.5\"", "2 Models", "iphone_old.png"),
  Device("10.2\"", "2 Models", "iphone_old.png"),
  Device("9.7\" Pro", "1 Model", "iphone_new.png"),
  Device("9.7\" Air", "4 Models", "iphone_old.png"),
  Device("9.7\" Retina", "2 Models", "iphone_old.png"),
  Device("9.7\"", "2 Models", "iphone_old.png"),
  Device("7.9\" Display P3", "1 Model", "iphone_old.png"),
  Device("7.9\" Retina", "3 Models", "iphone_new.png"),
  Device("7.9\"", "1 Model", "iphone_old.png"),
];

final ipodDevicesPageIconData = [
  Device("4\"", "3 Models", "iphone_old.png"),
  Device("3.5\" Retina", "1 Model", "iphone_old.png"),
  Device("3.5\"", "3 Models", "iphone_old.png"),
];

final watchDevicesPageIconData = [
  Device("44mm", "4 Models", "iphone_new.png"),
  Device("42mm", "4 Models", "iphone_new.png"),
  Device("40mm", "4 Models", "iphone_new.png"),
  Device("38mm", "4 Models", "iphone_new.png"),
];

final appleTVDevicesPageIconData = [
  Device("4K", "2 Models", "iphone_new.png"),
  Device("HD", "1 Model", "iphone_new.png"),
];

final carplayDevicesPageIconData = [
  Device("8:3", "24 Models", "iphone_new.png"),
  Device("16:9 HD", "24 Models", "iphone_new.png"),
  Device("16:9", "24 Models", "iphone_new.png"),
  Device("5:3", "24 Models", "iphone_new.png"),
];

Map<String, ImageIcon> icons = {
  'contrast': ImageIcon(AssetImage('assets/icons/contrastRatio.png')),
  'earSize': ImageIcon(AssetImage('assets/icons/earSize.png')),
  'ios': ImageIcon(AssetImage('assets/icons/ios.png')),
  'landscape': ImageIcon(AssetImage('assets/icons/landscape.png')),
  'landscapeHomeIndicator':
      ImageIcon(AssetImage('assets/icons/landscapeHomeIndicator.png')),
  'landscapeStatusBar':
      ImageIcon(AssetImage('assets/icons/landscapeStatusBar.png')),
  'large': ImageIcon(AssetImage('assets/icons/large.png')),
  'medium': ImageIcon(AssetImage('assets/icons/medium.png')),
  'notchSize': ImageIcon(AssetImage('assets/icons/notchSize.png')),
  'portrait': ImageIcon(AssetImage('assets/icons/portrait.png')),
  'portraitHomeIndicator':
      ImageIcon(AssetImage('assets/icons/portraitHomeIndicator.png')),
  'portraitStatusBar':
      ImageIcon(AssetImage('assets/icons/portraitStatusBar.png')),
  'ppi': ImageIcon(AssetImage('assets/icons/ppi.png')),
  'resolution': ImageIcon(AssetImage('assets/icons/resolution.png')),
  'small': ImageIcon(AssetImage('assets/icons/small.png')),
  'trueTone': ImageIcon(AssetImage('assets/icons/trueTone.png')),
  'aspectRatio': ImageIcon(AssetImage('assets/icons/aspectRatio.png')),
  'display': ImageIcon(AssetImage('assets/icons/display.png')),
  'halfLandscapeSplit':
      ImageIcon(AssetImage('assets/icons/halfLandscapeSplit.png')),
  'ipadOS': ImageIcon(AssetImage('assets/icons/ipadOS.png')),
  'landscapeSplideOver': ImageIcon(
      AssetImage('assets/icons/assets/icons/landscapeSplideOver.png')),
  'oneThirdLandscapeSplit':
      ImageIcon(AssetImage('assets/icons/oneThirdLandscapeSplit.png')),
  'oneThirdPortraitSplit':
      ImageIcon(AssetImage('assets/icons/oneThirdPortraitSplit.png')),
  'portraitSlideOver':
      ImageIcon(AssetImage('assets/icons/portraitSlideOver.png')),
  'twoThirdLandscapeSplit':
      ImageIcon(AssetImage('assets/icons/twoThirdLandscapeSplit.png')),
  'twoThirdPortraitSplit':
      ImageIcon(AssetImage('assets/icons/twoThirdPortraitSplit.png')),
  'rightOverScan': ImageIcon(AssetImage('assets/icons/rightOverScan.png')),
};
