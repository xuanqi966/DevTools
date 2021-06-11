import 'package:dev_tools/models/devices/display.dart';
import '../../../models/devices/device.dart';
import '../../../models/device-attributes/property.dart';
import '../../../models/device-attributes/safe-area.dart';
import '../../../models/device-attributes/size-class.dart';
import '../../../models/device-attributes/iwidget.dart';
import '../../../models/device-attributes/multitasking.dart';
import 'data.dart';

Map<String, Device> ipads = {
  '12.9\" Pro (5th Gen)': Device(
      '12.9\" Pro (5th Gen)', '2021', 'assets/images/ipad/ipad-ipro129in5.png'),
  '11\" Pro (3rd Gen)': Device(
      '11\" Pro (3rd Gen)', '2021', 'assets/images/ipad/ipad-ipro11in3.png'),
  '12.9\" Pro (4th Gen)': Device(
      '12.9\" Pro (4th Gen)', '2020', 'assets/images/ipad/ipad-ipro129in4.png'),
  '11\" Pro (2nd Gen)': Device(
      '11\" Pro (2nd Gen)', '2020', 'assets/images/ipad/ipad-ipro11in2.png'),
  'Air (4th Gen)':
      Device('Air (4th Gen)', '2020', 'assets/images/ipad/ipad-iair4.png'),
  'iPad (8th Gen)':
      Device('iPad (8th Gen)', '2020', 'assets/images/ipad/ipad-i8.png'),
  'Air (3rd Gen)':
      Device('Air (3rd Gen)', '2019', 'assets/images/ipad/ipad-iair3.png'),
  'iPad (7th Gen)':
      Device('iPad (7th Gen)', '2019', 'assets/images/ipad/ipad-i7.png'),
  'Mini (5th Gen)':
      Device('Mini (5th Gen)', '2019', 'assets/images/ipad/ipad-imini5.png'),
  '12.9\" Pro (3rd Gen)': Device(
      '12.9\" Pro (3rd Gen)', '2018', 'assets/images/ipad/ipad-ipro129in3.png'),
  '11\" Pro (1st Gen)': Device(
      '11\" Pro (1st Gen)', '2018', 'assets/images/ipad/ipad-ipro11in1.png'),
  'iPad (6th Gen)':
      Device('iPad (6th Gen)', '2018', 'assets/images/ipad/ipad-i6.png'),
  '12.9\" Pro (2nd Gen)':
      Device('12.9\" Pro (2nd Gen)', '2018', 'assets/images/ipad/ipad-i6.png'),
  '10.5\" Pro':
      Device('10.5\" Pro', '2017', 'assets/images/ipad/ipad-ipro105in1.png'),
  'iPad (5th Gen)':
      Device('iPad (5th Gen)', '2017', 'assets/images/ipad/ipad-i5.png'),
  '9.7\" Pro':
      Device('9.7\" Pro', '2016', 'assets/images/ipad/ipad-ipro97in1.png'),
  '12.9\" Pro (1st Gen)': Device(
      '12.9\" Pro (1st Gen)', '2015', 'assets/images/ipad/ipad-ipro129in1.png'),
  'Mini (4th Gen)':
      Device('Mini (4th Gen)', '2015', 'assets/images/ipad/ipad-imini4.png'),
  'Air (2nd Gen)':
      Device('Air (2nd Gen)', '2014', 'assets/images/ipad/ipad-iair2.png'),
  'iPad (4th Gen)':
      Device('iPad (4th Gen)', '2014', 'assets/images/ipad/ipad-i4.png'),
  'Mini (3rd Gen)':
      Device('Mini (3rd Gen)', '2014', 'assets/images/ipad/ipad-imini3.png'),
  'Air (1st Gen)':
      Device('Air (1st Gen)', '2013', 'assets/images/ipad/ipad-iair1.png'),
  'Mini (2nd Gen)':
      Device('Mini (2nd Gen)', '2013', 'assets/images/ipad/ipad-imini2.png'),
  'iPad (3rd Gen)':
      Device('iPad (3rd Gen)', '2012', 'assets/images/ipad/ipad-i3.png'),
  'Mini (1st Gen)':
      Device('Mini (1st Gen)', '2012', 'assets/images/ipad/ipad-imini1.png'),
  'iPad (2nd Gen)':
      Device('iPad (2nd Gen)', '2011', 'assets/images/ipad/ipad-i2.png'),
  'iPad (1st Gen)':
      Device('iPad (1st Gen)', '2010', 'assets/images/ipad/ipad-i1.png'),
};

Map<int, List<Display>> ipadDisplays = {
  0: [twelveNineXdrS, twelveNineXdrZ],
  1: [twelveNineLiquidRetinaS, twelveNineLiquidRetinaZ],
  2: [twelveNineDisplayS, twelveNineDisplayZ],
  3: [twelveNineS, twelveNineZ],
  4: [eleven, null],
  5: [tenNine, null],
  6: [tenFive, null],
  7: [tenTwo, null],
  8: [nineSevenPro, null],
  9: [nineSevenAir, null],
  10: [nineSevenRetina, null],
  11: [nineSeven, null],
  12: [sevenNineP3, null],
  13: [sevenNineRetina, null],
  14: [sevenNine, null]
};

Map<int, List<Display>> ipadDisplays2 = {
  //12.9 Pro (5th)
  0: [twelveNineXdrS, twelveNineXdrZ],
  //11 pro (3rd)
  1: [eleven, null],
  //12.9 pro (4th)
  2: [twelveNineLiquidRetinaS, twelveNineLiquidRetinaZ],
  //11 pro (2nd)
  3: [eleven, null],
  //Air(4th)
  4: [tenNine, null],
  //ipad (8th)
  5: [tenTwo, null],
  //air(3rd)
  6: [tenFive, null],
  //ipad(7th)
  7: [tenTwo, null],
  //mini(5th)
  8: [sevenNineP3, null],
  //12.9 pro(3rd)
  9: [twelveNineLiquidRetinaS, twelveNineLiquidRetinaZ],
  //11"pro (1st)
  10: [eleven, null],
  //ipad(6th)
  11: [nineSevenAir, null],
  //12.9 pro (2nd)
  12: [twelveNineDisplayS, twelveNineDisplayZ],
  //10.5 pro
  13: [tenFive, null],
  //ipad(5th)
  14: [nineSevenAir, null],
  //9.7 pro
  15: [nineSevenPro, null],
  //12.9 pro(1st)
  16: [twelveNineS, twelveNineZ],
  //mini(4th)
  17: [sevenNineRetina, null],
  //air(2nd)
  18: [nineSevenAir, null],
  //ipad(4th)
  19: [nineSevenRetina, null],
  //mini(3rd)
  20: [sevenNineRetina, null],
  //air(1st)
  21: [nineSevenAir, null],
  //mini(2nd)
  22: [sevenNineRetina, null],
  //ipad(3rd)
  23: [nineSevenRetina, null],
  //mini(1st)
  24: [sevenNine, null],
  //ipad(2nd)
  25: [nineSeven, null],
  //ipad(1st)
  26: [nineSeven, null],
};

Display twelveNineXdrS =
    Display('12.9\" XDR', "Display P3 XDR Retina LCD", "Standard", [
  ipads['12.9\" Pro (5th Gen)']
], [
  Property(
      icons['resolution'], 'Resolution', '1024 x 1366 px', '2048 x 2732 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(icons['oneThirdPortraitSplit'], '1/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '340 x 340 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '728 x 340 px'),
  Iwidget(icons['large'], 'Large', '364 x 382 px', '728 x 764 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '639 x 1366 px', '1278 x 2732 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '375 x 1366 px', '750 x 2732 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '375 x 1318 px', '750 x 2636 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '981 x 1024 px', '1962 x 2048 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '678 x 1024 px', '1356 x 2048 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 1024 px', '750 x 2048 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 976 px', '750 x 1952 px'),
]);

Display twelveNineXdrZ =
    Display('12.9\" XDR', "Display P3 XDR Retina LCD", "Zoomed", [
  ipads['12.9\" Pro (5th Gen)']
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(icons['oneThirdPortraitSplit'], '1/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 976 px', '640 x 1952 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 720 px', '640 x 1440 px'),
]);

Display twelveNineLiquidRetinaS =
    Display('12.9\" Liquid Retina', "Display P3 Retina LCD", "Standard", [
  ipads['12.9\" Pro (4th Gen)'],
  ipads['12.9\" Pro (3rd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '1024 x 1366 px', '2048 x 2732 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(icons['oneThirdPortraitSplit'], '1/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '340 x 340 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '728 x 340 px'),
  Iwidget(icons['large'], 'Large', '364 x 382 px', '728 x 764 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '639 x 1366 px', '1278 x 2732 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '375 x 1366 px', '750 x 2732 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '375 x 1318 px', '750 x 2636 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '981 x 1024 px', '1962 x 2048 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '678 x 1024 px', '1356 x 2048 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 1024 px', '750 x 2048 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 976 px', '750 x 1952 px'),
]);
Display twelveNineLiquidRetinaZ =
    Display('12.9\" Liquid Retina', "Display P3 Retina LCD", "Zoomed", [
  ipads['12.9\" Pro (4th Gen)'],
  ipads['12.9\" Pro (3rd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(icons['oneThirdPortraitSplit'], '1/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 976 px', '640 x 1952 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 720 px', '640 x 1440 px'),
]);

Display twelveNineDisplayS =
    Display('12.9\" Display P3', "Display P3 Retina LCD", "Standard", [
  ipads['12.9\" Pro (2nd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '1024 x 1366 px', '2048 x 2732 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(icons['oneThirdPortraitSplit'], '1/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '340 x 340 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '728 x 340 px'),
  Iwidget(icons['large'], 'Large', '364 x 382 px', '728 x 764 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '639 x 1366 px', '1278 x 2732 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '375 x 1366 px', '750 x 2732 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '375 x 1318 px', '750 x 2636 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '981 x 1024 px', '1962 x 2048 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '678 x 1024 px', '1356 x 2048 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 1024 px', '750 x 2048 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 976 px', '750 x 1952 px'),
]);
Display twelveNineDisplayZ =
    Display('12.9\" Display P3', "Display P3 Retina LCD", "Zoomed", [
  ipads['12.9\" Pro (2nd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 976 px', '640 x 1952 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 720 px', '640 x 1440 px'),
]);

Display twelveNineS = Display('12.9\"', "sRGB Retina LCD", "Standard", [
  ipads['12.9\" Pro (1st Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '1024 x 1366 px', '2048 x 2732 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '340 x 340 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '728 x 340 px'),
  Iwidget(icons['large'], 'Large', '364 x 382 px', '728 x 764 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '639 x 1366 px', '1278 x 2732 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '375 x 1366 px', '750 x 2732 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '375 x 1318 px', '750 x 2636 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '981 x 1024 px', '1962 x 2048 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '678 x 1024 px', '1356 x 2048 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 1024 px', '750 x 2048 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 976 px', '750 x 1952 px'),
]);
Display twelveNineZ = Display('12.9\"', "sRGB Retina LCD", "Zoomed", [
  ipads['12.9\" Pro (1st Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '12.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 976 px', '640 x 1952 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 720 px', '640 x 1440 px'),
]);

Display eleven = Display('11\"', "Display P3 Retina LCD", "Standard", [
  ipads['11\" Pro (1st Gen)'],
  ipads['11\" Pro (2nd Gen)'],
  ipads['11\" Pro (3rd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '834 x 1194 px', '1668 x 2388 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '11\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '504 x 1194 px', '1008 x 2388 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1194 px', '640 x 2388 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 1146 px', '640 x 2292 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '809 x 834 px', '1618 x 1668 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '592 x 834 px', '1184 x 1668 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 834 px', '750 x 1668 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 786 px', '750 x 1572 px'),
]);

Display tenNine = Display('10.9\"', "Display P3 Retina LCD", "Standard", [
  ipads['Air (4th Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '820 x 1180 px', '1640 x 2360 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '10.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '24 px', '48 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '24 px', '48 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator', '20 px',
      '40 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator', '20 px',
      '40 px')
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '490 x 1180 px', '980 x 2360 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1180 px', '640 x 2360 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 1132 px', '640 x 2264 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '795 x 820 px', '1590 x 1640 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '585 x 820 px', '1170 x 1640 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '375 x 820 px', '750 x 1640 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '375 x 772 px', '750 x 1544 px'),
]);

Display tenFive = Display('10.5\"', "Display P3 Retina LCD", "Standard", [
  ipads['Air (3rd Gen)'],
  ipads['10.5\" Pro'],
], [
  Property(
      icons['resolution'], 'Resolution', '834 x 1112 px', '1668 x 2224 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '10.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '504 x 1112 px', '1008 x 2224 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1112 px', '640 x 2224 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 1072 px', '640 x 2144 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '782 x 834 px', '1564 x 1668 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '551 x 834 px', '1102 x 1668 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 834 px', '640 x 1668 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 794 px', '640 x 1588 px'),
]);

Display tenTwo = Display('10.2\"', "sRGB Retina LCD", "Standard", [
  ipads['iPad (8th Gen)'],
  ipads['iPad (7th Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '810 x 1080 px', '1620 x 2160 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '10.2\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '480 x 1080 px', '960 x 2160 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1080 px', '640 x 2160 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 1040 px', '640 x 2080 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '750 x 810 px', '1500 x 1620 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '535 x 810 px', '1070 x 1620 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 810 px', '640 x 1620 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 770 px', '640 x 1540 px'),
]);

Display nineSevenPro =
    Display('9.7\" Pro', "Display P3 Retina LCD", "Standard", [
  ipads['9.7\" Pro'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '9.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 984 px', '640 x 1968 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 728 px', '640 x 1456 px'),
]);

Display nineSevenAir = Display('9.7\" Air', "sRGB Retina LCD", "Standard", [
  ipads['iPad (6th Gen)'],
  ipads['iPad (5th Gen)'],
  ipads['Air (2nd Gen)'],
  ipads['Air (1st Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '9.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '155 x 155 px', '310 x 310 px'),
  Iwidget(icons['medium'], 'Medium', '329 x 155 px', '658 x 310 px'),
  Iwidget(icons['large'], 'Large', '329 x 345 px', '658 x 690 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 984 px', '640 x 1968 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 728 px', '640 x 1456 px'),
]);

Display nineSevenRetina =
    Display('9.7\" Retina', "sRGB Retina LCD", "Standard", [
  ipads['iPad (4th Gen)'],
  ipads['iPad (3rd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 10'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '9.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 984 px', '640 x 1968 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 728 px', '640 x 1456 px'),
]);

Display nineSeven = Display('9.7\"', "sRGB LCD", "Standard", [
  ipads['iPad (2nd Gen)'],
  ipads['iPad (1st Gen)'],
], [
  Property(icons['resolution'], 'Resolution', '768 x 1024 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 9'),
  Property(icons['ppi'], 'PPI', '264'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB LCD', '9.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [], [
  Multitasking(
      icons['twoThirdPortraitSplit'], "2/3 Portrait Split", '438 x 1024 px'),
  Multitasking(
      icons['oneThirdPortraitSplit'], "1/3 Portrait Split", '320 x 1024 px'),
  Multitasking(
      icons['portraitSlideOver'], "Portrait Slide Over", '320 x 984 px'),
  Multitasking(
      icons['twoThirdLandscapeSplit'], "2/3 Landscape Split", '694 x 768 px'),
  Multitasking(
      icons['halfLandscapeSplit'], "1/2 Landscape Split", '507 x 768 px'),
  Multitasking(
      icons['oneThirdLandscapeSplit'], "1/3 Landscape Split", '320 x 768 px'),
  Multitasking(
      icons['landscapeSplideOver'], "Landscape Slide Over", '320 x 728 px'),
]);

Display sevenNineP3 =
    Display('7.9\" Display P3', "Display P3 Retina LCD", "Standard", [
  ipads['Mini (5th Gen)']
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '7.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '158 x 158 px', '316 x 316 px'),
  Iwidget(icons['medium'], 'Medium', '338 x 158 px', '676 x 316 px'),
  Iwidget(icons['large'], 'Large', '338 x 354 px', '676 x 708 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 984 px', '640 x 1968 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 728 px', '640 x 1456 px'),
]);

Display sevenNineRetina =
    Display('7.9\" Retina', "sRGB Retina LCD", "Standard", [
  ipads['Mini (4th Gen)'],
  ipads['Mini (3rd Gen)'],
  ipads['Mini (2nd Gen)'],
], [
  Property(
      icons['resolution'], 'Resolution', '768 x 1024 px', '1536 x 2048 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '7.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px', '40 px'),
  Safearea(
      icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px', '40 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '158 x 158 px', '316 x 316 px'),
  Iwidget(icons['medium'], 'Medium', '338 x 158 px', '676 x 316 px'),
  Iwidget(icons['large'], 'Large', '338 x 354 px', '676 x 708 px'),
], [
  Multitasking(icons['twoThirdPortraitSplit'], "2/3 Portrait Split",
      '438 x 1024 px', '876 x 2048 px'),
  Multitasking(icons['oneThirdPortraitSplit'], "1/3 Portrait Split",
      '320 x 1024 px', '640 x 2048 px'),
  Multitasking(icons['portraitSlideOver'], "Portrait Slide Over",
      '320 x 984 px', '640 x 1968 px'),
  Multitasking(icons['twoThirdLandscapeSplit'], "2/3 Landscape Split",
      '694 x 768 px', '1388 x 1536 px'),
  Multitasking(icons['halfLandscapeSplit'], "1/2 Landscape Split",
      '507 x 768 px', '1014 x 1536 px'),
  Multitasking(icons['oneThirdLandscapeSplit'], "1/3 Landscape Split",
      '320 x 768 px', '640 x 1536 px'),
  Multitasking(icons['landscapeSplideOver'], "Landscape Slide Over",
      '320 x 728 px', '640 x 1456 px'),
]);

Display sevenNine = Display('7.9\"', "sRGB LCD", "Standard", [
  ipads['Mini (1st Gen)'],
], [
  Property(icons['resolution'], 'Resolution', '768 x 1024 px'),
  Property(icons['ipadOS'], 'Last Supported By', 'iPadOS 9'),
  Property(icons['ppi'], 'PPI', '163'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '4:3'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB LCD', '7.9\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '20 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '20 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Compact',
      'Regular'),
  SizeClass(
      icons['oneThirdPortraitSplit'], '1/3 Portrait', 'Compact', 'Regular'),
  SizeClass(
      icons['portraitSlideOver'], 'Portrait Slide Over', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Regular'),
  SizeClass(icons['twoThirdLandscapeSplit'], '2/3 Landscape Split', 'Regular',
      'Regular'),
  SizeClass(
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Compact', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [], [
  Multitasking(
      icons['twoThirdPortraitSplit'], "2/3 Portrait Split", '438 x 1024 px'),
  Multitasking(
      icons['oneThirdPortraitSplit'], "1/3 Portrait Split", '320 x 1024 px'),
  Multitasking(
      icons['portraitSlideOver'], "Portrait Slide Over", '320 x 984 px'),
  Multitasking(
      icons['twoThirdLandscapeSplit'], "2/3 Landscape Split", '694 x 768 px'),
  Multitasking(
      icons['halfLandscapeSplit'], "1/2 Landscape Split", '507 x 768 px'),
  Multitasking(
      icons['oneThirdLandscapeSplit'], "1/3 Landscape Split", '320 x 768 px'),
  Multitasking(
      icons['landscapeSplideOver'], "Landscape Slide Over", '320 x 728 px'),
]);
