import 'package:dev_tools/models/devices/display.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import 'data.dart';

Map<String, Device> tvs = {
  "4K (6th Gen)": Device("4K (6th Gen)", "2021", "dummy"),
  "4K (5th Gen)": Device("4K (5th Gen)", "2017", "dummy"),
  "HD (4th Gen)": Device("HD (4th Gen)", "2015", "dummy"),
};

Map<String, List<Display>> displays = {
  '4K': [s4k],
  'HD': [hd],
};

Display s4k = Display('4K', null, "Standard", [
  tvs['4K (6th Gen)'],
  tvs['4K (5th Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '1920 x 1080 px', '3840 x 2160 px'),
  Property(icons['ios'], 'Last Supported By', 'tvOS 14'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
], [
  Safearea(icons['portraitStatusBar'], 'Top Overscan', '80 px', '160 px'),
  Safearea(icons['rightOverScan'], 'Right Overscan', '80 px', '160 px'),
  Safearea(
      icons['landscapeHomeIndicator'], 'Bottom Overscan', '80 px', '160 px'),
  Safearea(icons['oneThirdLandscapeSplit'], 'Left Overscan', '80 px', '160 px'),
], [], []);

Display hd = Display('HD', null, "Standard", [
  tvs['HD (4th Gen)'],
], [
  Property(icons['resolution'], 'Resolution', '1920 x 1080 px'),
  Property(icons['ios'], 'Last Supported By', 'tvOS 14'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
], [
  Safearea(icons['portraitStatusBar'], 'Top Overscan', '80 px'),
  Safearea(icons['rightOverScan'], 'Right Overscan', '80 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Bottom Overscan', '80 px'),
  Safearea(icons['oneThirdLandscapeSplit'], 'Left Overscan', '80 px'),
], [], []);
