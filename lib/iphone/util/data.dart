import '../homepage/homepage_icon.dart';
import '../displaypage/devicespage_icon.dart';
import '../infopage/properties.dart';
import 'package:flutter/material.dart';

const homePageIconData = const [
  HomePageIcon(
      imageName: "iPhone",
      iconImageVal: "iphone_icon.png",
      nextPage: "/iphone_page",
      devicesList: iphoneDevicesPageIconData),
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

const iphoneDevicesPageIconData = const [
  DevicesIcon(
      iconImageVal: "iphone_new.png", imageName: "6.7\"", subtitle: "1 Model"),
  DevicesIcon(
      iconImageVal: "iphone_new.png",
      imageName: "6.5\" XDR",
      subtitle: "1 Model"),
  DevicesIcon(
      iconImageVal: "iphone_new.png", imageName: "6.5\"", subtitle: "1 Model"),
  DevicesIcon(
      iconImageVal: "iphone_new.png",
      imageName: "6.1\" Super Retina",
      subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_new.png",
      imageName: "6.1\" Liquid Retina",
      subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_new.png",
      imageName: "5.8\" XDR",
      subtitle: "1 Model"),
  DevicesIcon(
      iconImageVal: "iphone_old.png",
      imageName: "5.5\" Display P3",
      subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_old.png", imageName: "5.5\"", subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_new.png", imageName: "5.4\"", subtitle: "1 Model"),
  DevicesIcon(
      iconImageVal: "iphone_old.png", imageName: "4.7\"", subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_old.png", imageName: "4\"", subtitle: "4 Models"),
  DevicesIcon(
      iconImageVal: "iphone_old.png",
      imageName: "3.5\" Retina",
      subtitle: "2 Models"),
  DevicesIcon(
      iconImageVal: "iphone_old.png", imageName: "3.5\"", subtitle: "3 Models"),
];

final List<Properties> propertyData = <Properties>[
  Properties(<DevicesIcon>[
    DevicesIcon(
        iconImageVal: "iphone_old.png",
        imageName: "3.5\"",
        subtitle: "3 Models"),
    DevicesIcon(
        iconImageVal: "iphone_old.png",
        imageName: "3.5\"",
        subtitle: "3 Models"),
    DevicesIcon(
        iconImageVal: "iphone_old.png",
        imageName: "3.5\"",
        subtitle: "3 Models")
  ])
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
