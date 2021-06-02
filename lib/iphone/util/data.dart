import '../homepage/homepage_icon.dart';
import '../displaypage/devicespage_icon.dart';
import '../infopage/properties.dart';
import 'iphone-data.dart';
import 'package:flutter/material.dart';
import '../../models/devices/device.dart';

final homePageIconData = [
  HomePageIcon(
      imageName: "iPhone",
      iconImageVal: "iphone_icon.png",
      nextPage: "/iphone_page",
      devicesList: iphoneDevicesPageIconData,
      displayList: displays,
      phonesList: iphones),
  HomePageIcon(
      imageName: "iPad",
      iconImageVal: "ipad_icon.png",
      nextPage: "/ipad_page",
      devicesList: iphoneDevicesPageIconData),
  HomePageIcon(
      imageName: "iPod Touch",
      iconImageVal: "ipod_icon.png",
      nextPage: "/ipod_page",
      devicesList: iphoneDevicesPageIconData),
  HomePageIcon(
      imageName: "Apple Watch",
      iconImageVal: "apple_watch_icon.png",
      nextPage: "/applewatch_page",
      devicesList: iphoneDevicesPageIconData),
  HomePageIcon(
      imageName: "Apple TV",
      iconImageVal: "apple_tv_icon.png",
      nextPage: "/appletv_page",
      devicesList: iphoneDevicesPageIconData),
  HomePageIcon(
      imageName: "CarPlay",
      iconImageVal: "car_icon.png",
      nextPage: "/carplay_page",
      devicesList: iphoneDevicesPageIconData),
];

final iphoneDevicesPageIconData = [
  Device("6.7\"", "1 Model", "iphone_new.png"),
  Device("6.5\" XDR", "1 Model", "iphone_new.png"),
  Device("6.5\"", "1 Model", "iphone_new.png"),
  Device("6.1\" Super Retina", "2 Models", "iphone_new.png"),
  Device("6.1\" Liquid Retina", "2 Models", "iphone_new.png"),
  Device("5.8\" XDR", "1 Model", "iphone_new.png"),
  Device("5.5\" Display P3", "2 Models", "iphone_old.png"),
  Device("5.5\"", "2 Models", "iphone_old.png"),
  Device("5.4\"", "1 Model", "iphone_new.png"),
  Device("4.7\"", "2 Models", "iphone_old.png"),
  Device("4\"", "4 Models", "iphone_old.png"),
  Device("3.5\" Retina", "2 Models", "iphone_old.png"),
  Device("3.5\"", "3 Models", "iphone_old.png"),
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
