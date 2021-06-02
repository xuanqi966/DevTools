import 'package:dev_tools/models/devices/display.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';
import 'data.dart';

Map<String, Device> watches = {
  "Series 6 (44mm)": Device("Series 6 (44mm)", "2020", "dummy"),
  "Series 6 (40mm)": Device("Series 6 (40mm)", "2020", "dummy"),
  "SE (44mm)": Device("SE (44mm)", "2020", "dummy"),
  "SE (40mm)": Device("SE (40mm)", "2020", "dummy"),
  "Series 5 (44mm)": Device("Series 5 (44mm)", "2019", "dummy"),
  "Series 5 (40mm)": Device("Series 5 (40mm)", "2019", "dummy"),
  "Series 4 (44mm)": Device("Series 4 (44mm)", "2018", "dummy"),
  "Series 4 (40mm)": Device("Series 4 (40mm)", "2018", "dummy"),
  "Series 3 (42mm)": Device("Series 3 (42mm)", "2017", "dummy"),
  "Series 3 (38mm)": Device("Series 3 (38mm)", "2017", "dummy"),
  "Series 2 (42mm)": Device("Series 2 (42mm)", "2016", "dummy"),
  "Series 2 (38mm)": Device("Series 2 (38mm)", "2016", "dummy"),
  "Series 1 (42mm)": Device("Series 1 (42mm)", "2016", "dummy"),
  "Series 1 (38mm)": Device("Series 1 (38mm)", "2016", "dummy"),
  "Apple Watch (42mm)": Device("Apple Watch (42mm)", "2015", "dummy"),
  "Apple Watch (38mm)": Device("Apple Watch (38mm)", "2015", "dummy"),
};

Map<String, List<Display>> displays = {
  '44mm': [s44mm],
  '42mm': [s42mm],
  '40mm': [s40mm],
  '38mm': [s38mm],
};

Display s44mm = Display('44mm', "LTPO Retina OLED", "Standard", [
  watches['Series 6 (44mm)'],
  watches['SE (44mm)'],
  watches['Series 5 (44mm)'],
  watches['Series 4 (44mm)'],
], [
  Property(icons['resolution'], 'Resolution', '184 x 224 px', '368 x 448 px'),
  Property(icons['ios'], 'Last Supported By', 'watchOS 7'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:13'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'LTPO Retina OLED'),
], [
  Safearea(icons['portraitStatusBar'], 'Status Bar', '31 px', '62 px'),
  Safearea(icons['portraitHomeIndicator'], 'Bottom Margin', '31 px', '62 px'),
], [], []);

Display s42mm = Display('42mm', "Retina OLED", "Standard", [
  watches['Series 3 (42mm)'],
  watches['Series 2 (42mm)'],
  watches['Series 1 (42mm)'],
  watches['Apple Watch (42mm)'],
], [
  Property(icons['resolution'], 'Resolution', '156 x 195 px', '312 x 390 px'),
  Property(icons['ios'], 'Last Supported By', 'watchOS 7'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '5:4'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'Retina OLED'),
], [
  Safearea(icons['portraitStatusBar'], 'Status Bar', '21 px', '42 px'),
  Safearea(icons['portraitHomeIndicator'], 'Bottom Margin', '0 px', '0 px'),
], [], []);

Display s40mm = Display('40mm', "LTPO Retina OLED", "Standard", [
  watches['Series 6 (40mm)'],
  watches['SE (40mm)'],
  watches['Series 5 (40mm)'],
  watches['Series 4 (40mm)'],
], [
  Property(icons['resolution'], 'Resolution', '162 x 197 px', '324 x 394 px'),
  Property(icons['ios'], 'Last Supported By', 'watchOS 7'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:13'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'LTPO Retina OLED'),
], [
  Safearea(icons['portraitStatusBar'], 'Status Bar', '28 px', '56 px'),
  Safearea(icons['portraitHomeIndicator'], 'Bottom Margin', '28 px', '56 px'),
], [], []);

Display s38mm = Display('38mm', "Retina OLED", "Standard", [
  watches['Series 3 (38mm)'],
  watches['Series 2 (38mm)'],
  watches['Series 1 (38mm)'],
  watches['Apple Watch (38mm)'],
], [
  Property(icons['resolution'], 'Resolution', '136 x 170 px', '270 x 340 px'),
  Property(icons['ios'], 'Last Supported By', 'watchOS 7'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '5:4'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'Retina OLED'),
], [
  Safearea(icons['portraitStatusBar'], 'Status Bar', '19 px', '38 px'),
  Safearea(icons['portraitHomeIndicator'], 'Bottom Margin', '0 px', '0 px'),
], [], []);
