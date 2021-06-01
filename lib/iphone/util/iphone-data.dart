import 'package:dev_tools/models/devices/display.dart';
import 'package:flutter/material.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';

Map<String, Device> iphones = {
  "12 Pro Max": Device("12 Pro Max", "2020", "dummy"),
  "12 Pro": Device("12 Pro", "2020", "dummy"),
  "12": Device("12", "2020", "dummy"),
  "12 mini": Device("12 mini", "2020", "dummy"),
  "SE (2nd Gen)": Device("SE (2nd Gen)", "2020", "dummy"),
  "11 Pro Max": Device("11 Pro Max", "2019", "dummy"),
  "11 Pro": Device("11 Pro", "2019", "dummy"),
  "11": Device("11", "2019", "dummy"),
  "XS Max": Device("XS Max", "2018", "dummy"),
  "XS": Device("XS", "2018", "dummy"),
  "XR": Device("XR", "2018", "dummy"),
  "X": Device("X", "2017", "dummy"),
  "8 Plus": Device("8 Plus", "2017", "dummy"),
  "8": Device("8", "2017", "dummy"),
  "7 Plus": Device("7 Plus", "2016", "dummy"),
  "7": Device("7", "2016", "dummy"),
  "6s Plus": Device("6s Plus", "2015", "dummy"),
  "6s": Device("6s", "2015", "dummy"),
  "6 Plus": Device("6 Plus", "2014", "dummy"),
  "6": Device("6", "2014", "dummy"),
  "SE (1st Gen)": Device("SE (1st Gen)", "2016", "dummy"),
  "5s": Device("5s", "2013", "dummy"),
  "5c": Device("5c", "2013", "dummy"),
  "5": Device("5", "2012", "dummy"),
  "4s": Device("4s", "2011", "dummy"),
  "4": Device("4", "2010", "dummy"),
  "3GS": Device("3GS", "2009", "dummy"),
  "3G": Device("3G", "2008", "dummy"),
  "iPhone": Device("iPhone", "2007", "dummy"),
};

Display sixSevenS = Display('6.7\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '428 x 926 px', '1284 x 2778 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '47 px', '141 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '34 px', '102 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '210 x 32 px', '630 x 96 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '109 x 32 px', '327 x 96 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '170 x 170 px', '510 x 510 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '364 x 170 px', '1092 x 510 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '364 x 383 px', '1092 x 1149 px'),
]);

Display sixSevenZ = Display('6.7\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '428 x 926 px', '1284 x 2778 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '41 px', '123 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '30 px', '90 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '185 x 28 px', '555 x 84 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '95 x 28 px', '285 x 84 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '170 x 170 px', '531 x 531 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '376 x 177 px', '1128 x 531 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '376 x 394 px', '1128 x 1182 px'),
]);

Display sixFiveXDRZ =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['11 Pro Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '40 px', '120 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '31 px', '93 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '189 x 27 px', '567 x 81 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '93 x 27 px', '279 x 81 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '364 x 172 px', '1092 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '364 x 381 px', '1092 x 1143 px'),
]);

Display sixFiveXDRS =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '34 px', '102 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '210 x 30 px', '630 x 90 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '102 x 30 px', '306 x 90 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '169 x 169 px', '507 x 507 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '360 x 169 px', '1080 x 507 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '360 x 379 px', '1080 x 1137 px'),
]);

Display sixFiveS = Display('6.5\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['XS Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '414 x 896 px', '1242 x 2668 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '1,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '44 px', '132 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '34 px', '102 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '210 x 30 px', '630 x 90 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '102 x 30 px', '306 x 90 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '169 x 169 px', '507 x 507 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '360 x 169 px', '1080 x 507 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '360 x 379 px', '1080 x 1137 px'),
]);

Display sixFiveZ = Display('6.5\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['XS Max']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '375 x 812 px', '1125 x 2436 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '458'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '1,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '40 px', '120 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '31 px', '93 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '189 x 27 px', '567 x 81 px px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '93 x 27 px', '279 x 81 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '364 x 172 px', '1092 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '364 x 381 px', '1092 x 1143 px'),
]);

Display sixOneSuperRetinaS =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '390 x 844 px', '1170 x 2532 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '460'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '47 px', '141 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '34 px', '102 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '212 x 32 px', '636 x 96 px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '89 x 32 px', '267 x 96 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '158 x 158 px', '474 x 474 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '338 x 158 px', '1014 x 474 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '338 x 354 px', '1014 x 1062 px'),
]);
Display sixOneSuperRetinaZ =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '390 x 844 px', '1170 x 2532 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '460'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '2,000,000:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display P3 XDR Retina OLED'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '39 px', '117 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '28 px', '84 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '63 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '172 x 26 px', '516 x 78 px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '74 x 26 px', '222 x 78 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '172 x 172 px', '516 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '356 x 172 px', '1068 x 516 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '356 x 379 px', '1068 x 1137 px'),
]);

Display sixOneLiquidRetinaS =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Standard", [
  iphones['11'],
  iphones['XR']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '414 x 896 px', '828 x 1792 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '326'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '1,400:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display R3 Retina LCD'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '48 px', '96 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '34 px', '68 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '42 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '212 x 32 px', '424 x 64 px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '101 x 32 px', '202 x 64 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '158 x 158 px', '316 x 316 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '338 x 158 px', '676 x 316 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '338 x 354 px', '676 x 708 px'),
]);
Display sixOneLiquidRetinaZ =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Zoomed", [
  iphones['11'],
  iphones['XR']
], [
  Property(Icon(Icons.ac_unit), 'Resolution', '375 x 812 px', '750 x 1624 px'),
  Property(Icon(Icons.ac_unit), 'Last Supported By', 'iOS 14'),
  Property(Icon(Icons.ac_unit), 'PPI', '326'),
  Property(Icon(Icons.ac_unit), 'Aspect Ration', '19.5:9'),
  Property(Icon(Icons.ac_unit), 'COntrast Ratio', '1,400:1'),
  Property(Icon(Icons.ac_unit), 'True Tone', 'Supported'),
  Property(Icon(Icons.ac_unit), 'Display Type', 'Display R3 Retina LCD'),
], [
  Safearea(Icon(Icons.ac_unit), 'Portrait Status Bar', '44 px', '88 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Status Bar', '0 px', '0 px'),
  Safearea(Icon(Icons.ac_unit), 'Portrait Home Indicator', '31 px', '62 px'),
  Safearea(Icon(Icons.ac_unit), 'Landscape Home Indicator', '21 px', '42 px'),
  Safearea(Icon(Icons.ac_unit), 'Notch Size', '172 x 26 px', '344 x 52 px'),
  Safearea(Icon(Icons.ac_unit), 'Ear Size', '101.5 x 26 px', '203 x 52 px'),
], [
  SizeClass(Icon(Icons.ac_unit), 'Portrait', 'Compact', 'Regular'),
  SizeClass(Icon(Icons.ac_unit), 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(Icon(Icons.ac_unit), 'Small', '172 x 172 px', '344 x 344 px'),
  Iwidget(Icon(Icons.ac_unit), 'Medium', '356 x 172 px', '712 x 344 px'),
  Iwidget(Icon(Icons.ac_unit), 'Large', '356 x 379 px', '712 x 758 px'),
]);
