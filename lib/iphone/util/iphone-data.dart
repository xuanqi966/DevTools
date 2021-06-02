import 'package:dev_tools/models/devices/display.dart';
import 'package:flutter/material.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';
import 'data.dart';

Map<String, Device> iphones = {
  "12 Pro Max":
      Device("12 Pro Max", "2020", "assets/images/iphone/iphone-i12promax.png"),
  "12 Pro": Device("12 Pro", "2020", "assets/images/iphone/iphone-i12pro.png"),
  "12": Device("12", "2020", "assets/images/iphone/iphone-i12.png"),
  "12 mini":
      Device("12 mini", "2020", "assets/images/iphone/iphone-i12mini.png"),
  "SE (2nd Gen)":
      Device("SE (2nd Gen)", "2020", "assets/images/iphone/iphone-ise2.png"),
  "11 Pro Max":
      Device("11 Pro Max", "2019", "assets/images/iphone/iphone-i11promax.png"),
  "11 Pro": Device("11 Pro", "2019", "assets/images/iphone/iphone-i11pro.png"),
  "11": Device("11", "2019", "assets/images/iphone/iphone-i11.png"),
  "XS Max": Device("XS Max", "2018", "assets/images/iphone/iphone-ixsmax.png"),
  "XS": Device("XS", "2018", "assets/images/iphone/iphone-ixs.png"),
  "XR": Device("XR", "2018", "assets/images/iphone/iphone-ixr.png"),
  "X": Device("X", "2017", "assets/images/iphone/iphone-ix.png"),
  "8 Plus": Device("8 Plus", "2017", "assets/images/iphone/iphone-i8plus.png"),
  "8": Device("8", "2017", "assets/images/iphone/iphone-i8.png"),
  "7 Plus": Device("7 Plus", "2016", "assets/images/iphone/iphone-i7plus.png"),
  "7": Device("7", "2016", "assets/images/iphone/iphone-i7.png"),
  "6s Plus":
      Device("6s Plus", "2015", "assets/images/iphone/iphone-i6splus.png"),
  "6s": Device("6s", "2015", "assets/images/iphone/iphone-i6s.png"),
  "6 Plus": Device("6 Plus", "2014", "assets/images/iphone/iphone-i6plus.png"),
  "6": Device("6", "2014", "assets/images/iphone/iphone-i6.png"),
  "SE (1st Gen)":
      Device("SE (1st Gen)", "2016", "assets/images/iphone/iphone-ise1.png"),
  "5s": Device("5s", "2013", "assets/images/iphone/iphone-i5s.png"),
  "5c": Device("5c", "2013", "assets/images/iphone/iphone-i5c.png"),
  "5": Device("5", "2012", "assets/images/iphone/iphone-i5.png"),
  "4s": Device("4s", "2011", "assets/images/iphone/iphone-i4s.png"),
  "4": Device("4", "2010", "assets/images/iphone/iphone-i4.png"),
  "3GS": Device("3GS", "2009", "assets/images/iphone/iphone-i3gs.png"),
  "3G": Device("3G", "2008", "assets/images/iphone/iphone-i3g.png"),
  "iPhone": Device("iPhone", "2007", "assets/images/iphone/iphone-i2g.png"),
};

Map<String, List<Display>> displays = {
  '6.7': [sixSevenS, sixSevenZ],
  '6.5 XDR': [sixFiveXDRS, sixFiveXDRZ],
  '6.5': [sixFiveS, sixFiveZ],
  '6.1 Super Retina': [sixOneSuperRetinaS, sixOneSuperRetinaZ],
  '6.1 Liquid Retina': [sixOneLiquidRetinaS, sixOneLiquidRetinaZ],
  '5.8 XDR': [fiveEightXdrS, fiveEightXdrZ],
  '5.8': [fiveEightS, fiveEightZ],
  '5.5 Display P3': [fiveFiveP3S, fiveFiveP3Z],
  '5.5': [fiveFiveS, fiveFiveZ],
  '5.4': [fiveFourS, fiveFourZ],
  '4.7 Display P3': [fourSevenDisplayP3S, fourSevenDisplayP3Z],
  '4.7': [fourSevenS, fourSevenZ],
  '4': [four],
  '3.5 Retina': [threeFiveRetina],
  '3.5': [threeFive]
};

Display sixSevenS = Display('6.7\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '428 x 926 px', '1284 x 2778 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '47 px', '141 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '210 x 32 px', '630 x 96 px px'),
  Safearea(icons['earSize'], 'Ear Size', '109 x 32 px', '327 x 96 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '510 x 510 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '1092 x 510 px'),
  Iwidget(icons['large'], 'Large', '364 x 383 px', '1092 x 1149 px'),
]);

Display sixSevenZ = Display('6.7\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '428 x 926 px', '1284 x 2778 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '41 px', '123 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '30 px',
      '90 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '185 x 28 px', '555 x 84 px px'),
  Safearea(icons['earSize'], 'Ear Size', '95 x 28 px', '285 x 84 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '531 x 531 px'),
  Iwidget(icons['medium'], 'Medium', '376 x 177 px', '1128 x 531 px'),
  Iwidget(icons['large'], 'Large', '376 x 394 px', '1128 x 1182 px'),
]);

Display sixFiveXDRZ =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['11 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '40 px', '120 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '31 px',
      '93 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '189 x 27 px', '567 x 81 px px'),
  Safearea(icons['earSize'], 'Ear Size', '93 x 27 px', '279 x 81 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 172 px', '1092 x 516 px'),
  Iwidget(icons['large'], 'Large', '364 x 381 px', '1092 x 1143 px'),
]);

Display sixFiveXDRS =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '210 x 30 px', '630 x 90 px px'),
  Safearea(icons['earSize'], 'Ear Size', '102 x 30 px', '306 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '169 x 169 px', '507 x 507 px'),
  Iwidget(icons['medium'], 'Medium', '360 x 169 px', '1080 x 507 px'),
  Iwidget(icons['large'], 'Large', '360 x 379 px', '1080 x 1137 px'),
]);

Display sixFiveS = Display('6.5\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['XS Max']
], [
  Property(icons['resolution'], 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '210 x 30 px', '630 x 90 px px'),
  Safearea(icons['earSize'], 'Ear Size', '102 x 30 px', '306 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '169 x 169 px', '507 x 507 px'),
  Iwidget(icons['medium'], 'Medium', '360 x 169 px', '1080 x 507 px'),
  Iwidget(icons['large'], 'Large', '360 x 379 px', '1080 x 1137 px'),
]);

Display sixFiveZ = Display('6.5\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['XS Max']
], [
  Property(icons['resolution'], 'Resolution', '375 x 812 px', '1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '40 px', '120 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '31 px',
      '93 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '189 x 27 px', '567 x 81 px px'),
  Safearea(icons['earSize'], 'Ear Size', '93 x 27 px', '279 x 81 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 172 px', '1092 x 516 px'),
  Iwidget(icons['large'], 'Large', '364 x 381 px', '1092 x 1143 px'),
]);

Display sixOneSuperRetinaS =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(icons['resolution'], 'Resolution', '390 x 844 px', '1170 x 2532 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '460'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '47 px', '141 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '212 x 32 px', '636 x 96 px'),
  Safearea(icons['earSize'], 'Ear Size', '89 x 32 px', '267 x 96 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '158 x 158 px', '474 x 474 px'),
  Iwidget(icons['medium'], 'Medium', '338 x 158 px', '1014 x 474 px'),
  Iwidget(icons['large'], 'Large', '338 x 354 px', '1014 x 1062 px'),
]);
Display sixOneSuperRetinaZ =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(icons['resolution'], 'Resolution', '390 x 844 px', '1170 x 2532 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '460'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '39 px', '117 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '28 px',
      '84 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '172 x 26 px', '516 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '74 x 26 px', '222 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '356 x 172 px', '1068 x 516 px'),
  Iwidget(icons['large'], 'Large', '356 x 379 px', '1068 x 1137 px'),
]);

Display sixOneLiquidRetinaS =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Standard", [
  iphones['11'],
  iphones['XR']
], [
  Property(icons['resolution'], 'Resolution', '414 x 896 px', '828 x 1792 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display R3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '48 px', '96 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '68 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '42 px'),
  Safearea(icons['notchSize'], 'Notch Size', '212 x 32 px', '424 x 64 px'),
  Safearea(icons['earSize'], 'Ear Size', '101 x 32 px', '202 x 64 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '158 x 158 px', '316 x 316 px'),
  Iwidget(icons['medium'], 'Medium', '338 x 158 px', '676 x 316 px'),
  Iwidget(icons['large'], 'Large', '338 x 354 px', '676 x 708 px'),
]);
Display sixOneLiquidRetinaZ =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Zoomed", [
  iphones['11'],
  iphones['XR']
], [
  Property(icons['resolution'], 'Resolution', '375 x 812 px', '750 x 1624 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display R3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '44 px', '88 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '31 px',
      '62 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '42 px'),
  Safearea(icons['notchSize'], 'Notch Size', '172 x 26 px', '344 x 52 px'),
  Safearea(icons['earSize'], 'Ear Size', '101.5 x 26 px', '203 x 52 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '172 x 172 px', '344 x 344 px'),
  Iwidget(icons['medium'], 'Medium', '356 x 172 px', '712 x 344 px'),
  Iwidget(icons['large'], 'Large', '356 x 379 px', '712 x 758 px'),
]);

Display fiveEightXdrS =
    Display('5.8\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro'],
], [
  Property(icons['resolution'], 'Resolution', '375 x 812 px', '1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', "Display P3 XDR Retina OLED"),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '209 x 30 px', '627 x 90 px'),
  Safearea(icons['earSize'], 'Ear Size', '83 x 30 px', '249 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '987 x 465 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '987 x 1035 px'),
]);
Display fiveEightXdrZ =
    Display('5.8\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro'],
], [
  Property(icons['resolution'], 'Resolution', '320 x 693 px', '960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '38 px', '114 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '29 px',
      '87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '178 x 26 px', '534 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '71 x 26 px', '213 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '165 x 165 px', '495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '343 x 165 px', '1029 x 495 px'),
  Iwidget(icons['large'], 'Large', '343 x 364 px', '1029 x 1092 px'),
]);
Display fiveEightS = Display('5.8\"', "Display P3 Retina OLED", "Standard", [
  iphones['XS'],
  iphones['X']
], [
  Property(icons['resolution'], 'Resolution', '375 x 812 px', '1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '209 x 30 px', '627 x 90 px'),
  Safearea(icons['earSize'], 'Ear Size', '83 x 30 px', '249 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '987 x 465 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '987 x 1035 px'),
]);
Display fiveEightZ = Display('5.8\"', "Display P3 Retina OLED", "Zoomed", [
  iphones['XS'],
  iphones['X']
], [
  Property(icons['resolution'], 'Resolution', '320 x 693 px', '960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '38 px', '114 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '29 px',
      '87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '178 x 26 px', '534 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '71 x 26 px', '213 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '165 x 165 px', '495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '343 x 165 px', '1029 x 495 px'),
  Iwidget(icons['large'], 'Large', '343 x 364 px', '1029 x 1092 px'),
]);
Display fiveFiveP3S =
    Display('5.5\" Display P3', "Display P3 Retina LCD", "Standard", [
  iphones['8 Plus'],
  iphones['7 Plus']
], [
  Property(icons['resolution'], 'Resolution', '414 x 736 px', '1242 x 2208 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '157 x 157 px', '471 x 471 px'),
  Iwidget(icons['medium'], 'Medium', '348 x 157 px', '1044 x 471 px'),
  Iwidget(icons['large'], 'Large', '348 x 352 px', '1044 x 1056 px'),
]);
Display fiveFiveP3Z =
    Display('5.5\" Display P3', "Display P3 Retina LCD", "Zoomed", [
  iphones['8 Plus'],
  iphones['7 Plus']
], [
  Property(icons['resolution'], 'Resolution', '375 x 667 px', '1125 x 2001 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
Display fiveFiveS = Display('5.5\"', "sRGB Retina LCD", "Standard", [
  iphones['6s Plus'],
  iphones['6 Plus']
], [
  Property(icons['resolution'], 'Resolution', '414 x 736 px', '1242 x 2208 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '157 x 157 px', '471 x 471 px'),
  Iwidget(icons['medium'], 'Medium', '348 x 157 px', '1044 x 471 px'),
  Iwidget(icons['large'], 'Large', '348 x 352 px', '1044 x 1056 px'),
]);
Display fiveFiveZ = Display('5.5\"', "sRGB Retina LCD", "Zoomed", [
  iphones['6s Plus'],
  iphones['6 Plus']
], [
  Property(icons['resolution'], 'Resolution', '375 x 667 px', '1125 x 2001 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '163 x 163 px', '489 x 489 px'),
  Iwidget(icons['medium'], 'Medium', '354 x 163 px', '1062 x 489 px'),
  Iwidget(icons['large'], 'Large', '354 x 357 px', '1062 x 1071 px'),
]);
Display fiveFourS = Display('5.4\"', "Display XDR P3 Retina OLED", "Standard", [
  iphones['12 mini']
], [
  Property(icons['resolution'], 'Resolution', '375 x 812 px', '1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '476'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display XDR P3 Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '50 px', '150 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '34 px',
      '102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '227 x 34 px', '681 x 102 px'),
  Safearea(icons['earSize'], 'Ear Size', '74 x 34 px', '222 x 102 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '987 x 465 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '987 x 1035 px'),
]);
Display fiveFourZ = Display('5.4\"', "Display XDR P3 Retina OLED", "Zoomed", [
  iphones['12 mini']
], [
  Property(icons['resolution'], 'Resolution', '320 x 693 px', '960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '476'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display XDR P3 Retina OLED'),
], [
  Safearea(
      icons['portraitStatusBar'], 'Portrait Status Bar', '43 px', '129 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '29 px',
      '87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '21 px',
      '63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '192 x 29 px', '576 x 87 px'),
  Safearea(icons['earSize'], 'Ear Size', '64 x 29 px', '192 x 87 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '165 x 165 px', '495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '342 x 165 px', '1026 x 495 px'),
  Iwidget(icons['large'], 'Large', '342 x 364 px', '1026 x 1092 px'),
]);

Display fourSevenDisplayP3S =
    Display('4.7\" Display P3', "Display P3 Retina LCD", "Standard", [
  iphones['SE (2nd Gen)'],
  iphones['8'],
  iphones['7']
], [
  Property(icons['resolution'], 'Resolution', '375 x 667 px', '750 x 1334 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '148 x 148 px', '296 x 296 px'),
  Iwidget(icons['medium'], 'Medium', '321 x 148 px', '642 x 296 px'),
  Iwidget(icons['large'], 'Large', '321 x 325 px', '642 x 650 px'),
]);
Display fourSevenDisplayP3Z =
    Display('4.7\" Display P3', "Display P3 Retina LCD", "Zoomed", [
  iphones['SE (2nd Gen)'],
  iphones['8'],
  iphones['7']
], [
  Property(icons['resolution'], 'Resolution', '320 x 568 px', '640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '166 x 166 px', '332 x 332 px'),
  Iwidget(icons['medium'], 'Medium', '343 x 166 px', '686 x 332 px'),
  Iwidget(icons['large'], 'Large', '343 x 365 px', '686 x 730 px'),
]);

Display fourSevenS = Display('4.7\"', "sRGD Retina LCD", "Standard", [
  iphones['6s'],
  iphones['6']
], [
  Property(icons['resolution'], 'Resolution', '375 x 667 px', '750 x 1334 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '148 x 148 px', '296 x 296 px'),
  Iwidget(icons['medium'], 'Medium', '321 x 148 px', '642 x 296 px'),
  Iwidget(icons['large'], 'Large', '321 x 325 px', '642 x 650 px'),
]);
Display fourSevenZ = Display('4.7\"', "sRGD Retina LCD", "Zoomed", [
  iphones['6s'],
  iphones['6']
], [
  Property(icons['resolution'], 'Resolution', '320 x 568 px', '640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '166 x 166 px', '332 x 332 px'),
  Iwidget(icons['medium'], 'Medium', '343 x 166 px', '686 x 332 px'),
  Iwidget(icons['large'], 'Large', '343 x 365 px', '686 x 730 px'),
]);

Display four = Display('4\"', "sRGD Retina LCD", "Standard", [
  iphones['SE (1st Gen)'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '320 x 568 px', '640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '141 x 141 px', '282 x 282 px'),
  Iwidget(icons['medium'], 'Medium', '292 x 141 px', '584 x 282 px'),
  Iwidget(icons['large'], 'Large', '292 x 312 px', '584 x 624 px'),
]);
Display threeFiveRetina =
    Display('3.5\" Retina', "sRGD Retina LCD", "Standard", [
  iphones['4s'],
  iphones['4'],
], [
  Property(icons['resolution'], 'Resolution', '320 x 480 px', '640 x 960 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 9'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '3:2'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
Display threeFive = Display('3.5\"', "sRGD LCD", "Standard", [
  iphones['3GS'],
  iphones['3G'],
  iphones['iPhone'],
], [
  Property(icons['resolution'], 'Resolution', '320 x 480 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 6'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '3:2'),
  Property(icons['contrast'], 'Contrast Ratio', '200:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
