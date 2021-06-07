import 'package:dev_tools/models/devices/display.dart';
import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import 'data.dart';

Map<String, Device> watches = {
  "Series 6 (44mm)": Device("Series 6 (44mm)", "2020",
      "assets/images/watch/applewatch-series6mm44.png"),
  "Series 6 (40mm)": Device("Series 6 (40mm)", "2020",
      "assets/images/watch/applewatch-series6mm40.png"),
  "SE (44mm)": Device(
      "SE (44mm)", "2020", "assets/images/watch/applewatch-seriesse1mm44.png"),
  "SE (40mm)": Device(
      "SE (40mm)", "2020", "assets/images/watch/applewatch-seriesse1mm40.png"),
  "Series 5 (44mm)": Device("Series 5 (44mm)", "2019",
      "assets/images/watch/applewatch-series5mm44.png"),
  "Series 5 (40mm)": Device("Series 5 (40mm)", "2019",
      "assets/images/watch/applewatch-series5mm40.png"),
  "Series 4 (44mm)": Device("Series 4 (44mm)", "2018",
      "assets/images/watch/applewatch-series4mm44.png"),
  "Series 4 (40mm)": Device("Series 4 (40mm)", "2018",
      "assets/images/watch/applewatch-series4mm40.png"),
  "Series 3 (42mm)": Device("Series 3 (42mm)", "2017",
      "assets/images/watch/applewatch-series3mm42.png"),
  "Series 3 (38mm)": Device("Series 3 (38mm)", "2017",
      "assets/images/watch/applewatch-series3mm38.png"),
  "Series 2 (42mm)": Device("Series 2 (42mm)", "2016",
      "assets/images/watch/applewatch-series2mm42.png"),
  "Series 2 (38mm)": Device("Series 2 (38mm)", "2016",
      "assets/images/watch/applewatch-series2mm38.png"),
  "Series 1 (42mm)": Device("Series 1 (42mm)", "2016",
      "assets/images/watch/applewatch-series1mm42.png"),
  "Series 1 (38mm)": Device("Series 1 (38mm)", "2016",
      "assets/images/watch/applewatch-series1mm38.png"),
  "Apple Watch (42mm)": Device("Apple Watch (42mm)", "2015",
      "assets/images/watch/applewatch-series0mm42.png"),
  "Apple Watch (38mm)": Device("Apple Watch (38mm)", "2015",
      "assets/images/watch/applewatch-series0mm38.png"),
};

Map<int, List<Display>> watchDisplays = {
  0: [s44mm, null],
  1: [s42mm, null],
  2: [s40mm, null],
  3: [s38mm, null],
};

Map<int, List<Display>> watchDisplays2 = {
  //series 6 - 44
  0: [s44mm, null],
  //series 6 - 40
  1: [s40mm, null],
  //se - 44
  2: [s44mm, null],
  //se - 40
  3: [s40mm, null],
  //series 5 - 44
  4: [s44mm, null],
  //series 5 - 40
  5: [s40mm, null],
  //series 4 - 44
  6: [s44mm, null],
  //series 4 - 40
  7: [s40mm, null],
  //series 3 - 42
  8: [s42mm, null],
  //series 3 - 38
  9: [s38mm, null],
  //series 2 - 42
  10: [s42mm, null],
  //series 2 - 38
  11: [s38mm, null],
  //series 1 - 42
  12: [s42mm, null],
  //series 1 - 38
  13: [s38mm, null],
  //apple watch - 42
  14: [s42mm, null],
  //apple watch - 38
  15: [s38mm, null],
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
  Property(icons['display'], 'Display', 'LTPO Retina OLED', '1.73\"'),
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
  Property(icons['display'], 'Display', 'Retina OLED', '1.65\"'),
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
  Property(icons['display'], 'Display', 'LTPO Retina OLED', '1.57\"'),
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
  Property(icons['resolution'], 'Resolution', '136 x 170 px', '272 x 340 px'),
  Property(icons['ios'], 'Last Supported By', 'watchOS 7'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '5:4'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'Retina OLED', '1.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Status Bar', '19 px', '38 px'),
  Safearea(icons['portraitHomeIndicator'], 'Bottom Margin', '0 px', '0 px'),
], [], []);
