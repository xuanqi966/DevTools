import 'package:flutter_searchbar/homepage/homepage_icon.dart';
import 'package:flutter_searchbar/displaypage/devicespage_icon.dart';
import 'package:flutter_searchbar/infopage/properties.dart';

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
