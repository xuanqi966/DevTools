import 'package:dev_tools/models/devices/display.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';
import 'data.dart';

Map<String, Device> ipods = {
  "7th Gen": Device("7th Gen", "2019", "assets/images/ipod/ipodtouch-gen7.png"),
  "6th Gen": Device("6th Gen", "2015", "assets/images/ipod/ipodtouch-gen6.png"),
  "5th Gen": Device("5th Gen", "2012", "assets/images/ipod/ipodtouch-gen5.png"),
  "4th Gen": Device("4th Gen", "2010", "assets/images/ipod/ipodtouch-gen4.png"),
  "3rd Gen": Device("3rd Gen", "2009", "assets/images/ipod/ipodtouch-gen3.png"),
  "2nd Gen": Device("2nd Gen", "2008", "assets/images/ipod/ipodtouch-gen2.png"),
  "1st Gen": Device("1st Gen", "2007", "assets/images/ipod/ipodtouch-gen1.png"),
};

Map<int, List<Display>> ipodDisplays = {
  0: [four, null],
  1: [threeFiveRetina, null],
  2: [threeFive, null]
};

Map<int, List<Display>> ipodDisplays2 = {
  //7th
  0: [four, null],
  //6th
  1: [four, null],
  //5th
  2: [four, null],
  //4th
  3: [threeFiveRetina, null],
  //3rd
  4: [threeFive, null],
  //2nd
  5: [threeFive, null],
  //1st
  6: [threeFive, null]
};

Display four = Display('4\"', "sRGB Retina LCD", "Standard", [
  ipods['7th Gen'],
  ipods['6th Gen'],
  ipods['5th Gen'],
], [
  Property(icons['resolution'], 'Resolution', '320 x 568 px', '640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
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
    Display('3.5 Retina\"', "sRGB Retina LCD", "Standard", [
  ipods['4th Gen']
], [
  Property(icons['resolution'], 'Resolution', '320 x 480 px', '640 x 960 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 6'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
Display threeFive = Display('3.5\"', "sRGB LCD", "Standard", [
  ipods['3rd Gen'],
  ipods['2nd Gen'],
  ipods['1st Gen'],
], [
  Property(icons['resolution'], 'Resolution', '428 x 926 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 5'),
  Property(icons['ppi'], 'PPI', '163'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '3:2'),
  Property(icons['contrast'], 'Contrast Ratio', '200:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB LCD'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
