import 'package:dev_tools/models/devices/display.dart';
import '../../../models/device-attributes/property.dart';
import '../../../models/device-attributes/safe-area.dart';
import 'data.dart';
import 'iphone-data.dart';

Map<int, List<Display>> carplayDisplays = {
  0: [s83, null],
  1: [s169hd, null],
  2: [s169, null],
  3: [s53, null]
};

Display s83 = Display('8:3', null, "Standard", [
  iphones['12 Pro Max'],
  iphones['12 Pro'],
  iphones['12'],
  iphones['12 mini'],
  iphones['SE (2nd Gen)'],
  iphones['11 Pro Max'],
  iphones['11 Pro'],
  iphones['11'],
  iphones['XS Max'],
  iphones['XS'],
  iphones['XR'],
  iphones['X'],
  iphones['8 Plus'],
  iphones['8'],
  iphones['7 Plus'],
  iphones['7'],
  iphones['SE (1st Gen)'],
  iphones['6s Plus'],
  iphones['6s'],
  iphones['6 Plus'],
  iphones['6'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '1920 x 720 px'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '8:3'),
], [
  Safearea(icons['oneThirdLandscapeSplit'], 'Status Bar', '90 px'),
], [], []);

Display s169hd = Display('16:9 HD', null, "Standard", [
  iphones['12 Pro Max'],
  iphones['12 Pro'],
  iphones['12'],
  iphones['12 mini'],
  iphones['SE (2nd Gen)'],
  iphones['11 Pro Max'],
  iphones['11 Pro'],
  iphones['11'],
  iphones['XS Max'],
  iphones['XS'],
  iphones['XR'],
  iphones['X'],
  iphones['8 Plus'],
  iphones['8'],
  iphones['7 Plus'],
  iphones['7'],
  iphones['SE (1st Gen)'],
  iphones['6s Plus'],
  iphones['6s'],
  iphones['6 Plus'],
  iphones['6'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '1280 x 720 px'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
], [
  Safearea(icons['oneThirdLandscapeSplit'], 'Status Bar', '90 px'),
], [], []);

Display s169 = Display('16:9', null, "Standard", [
  iphones['12 Pro Max'],
  iphones['12 Pro'],
  iphones['12'],
  iphones['12 mini'],
  iphones['SE (2nd Gen)'],
  iphones['11 Pro Max'],
  iphones['11 Pro'],
  iphones['11'],
  iphones['XS Max'],
  iphones['XS'],
  iphones['XR'],
  iphones['X'],
  iphones['8 Plus'],
  iphones['8'],
  iphones['7 Plus'],
  iphones['7'],
  iphones['SE (1st Gen)'],
  iphones['6s Plus'],
  iphones['6s'],
  iphones['6 Plus'],
  iphones['6'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '960 x 540 px'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
], [
  Safearea(icons['oneThirdLandscapeSplit'], 'Status Bar', '90 px'),
], [], []);

Display s53 = Display('5:3', null, "Standard", [
  iphones['12 Pro Max'],
  iphones['12 Pro'],
  iphones['12'],
  iphones['12 mini'],
  iphones['SE (2nd Gen)'],
  iphones['11 Pro Max'],
  iphones['11 Pro'],
  iphones['11'],
  iphones['XS Max'],
  iphones['XS'],
  iphones['XR'],
  iphones['X'],
  iphones['8 Plus'],
  iphones['8'],
  iphones['7 Plus'],
  iphones['7'],
  iphones['SE (1st Gen)'],
  iphones['6s Plus'],
  iphones['6s'],
  iphones['6 Plus'],
  iphones['6'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '800 x 480 px'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '5:3'),
], [
  Safearea(icons['oneThirdLandscapeSplit'], 'Status Bar', '90 px'),
], [], []);
