import 'package:dev_tools/models/devices/display.dart';
import 'package:flutter/material.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';
import '../../models/device-attributes/multitasking.dart';
import 'data.dart';

Map<String, Device> ipads = {
  '12.9\" Pro (5th Gen)': Device('12.9\" Pro (5th Gen)', '2021', 'dummy'),
  '11\" Pro (3rd Gen)': Device('11\" Pro (3rd Gen)', '2021', 'dummy'),
  '12.9\" Pro (4th Gen)': Device('12.9\" Pro (4th Gen)', '2020', 'dummy'),
  '11\" Pro (2nd Gen)': Device('11\" Pro (2nd Gen)', '2020', 'dummy'),
  'Air (4th Gen)': Device('Air (4th Gen)', '2020', 'dummy'),
  'iPad (8th Gen)': Device('iPad (8th Gen)', '2020', 'dummy'),
  'Air (3rd Gen)': Device('Air (3rd Gen)', '2019', 'dummy'),
  'iPad (7th Gen)': Device('iPad (7th Gen)', '2019', 'dummy'),
  'Mini (5th Gen)': Device('Mini (5th Gen)', '2019', 'dummy'),
  '12.9\" Pro (3rd Gen)': Device('12.9\" Pro (3rd Gen)', '2018', 'dummy'),
  '11\" Pro (1st Gen)': Device('11\" Pro (1st Gen)', '2018', 'dummy'),
  'iPad (6th Gen)': Device('iPad (6th Gen)', '2018', 'dummy'),
  '10.5\" Pro': Device('10.5\" Pro', '2017', 'dummy'),
  'iPad (5th Gen)': Device('iPad (5th Gen)', '2017', 'dummy'),
  '9.7\" Pro': Device('9.7\" Pro', '2016', 'dummy'),
  '12.9\" Pro (1st Gen)': Device('12.9\" Pro (1st Gen)', '2015', 'dummy'),
  'Mini (4th Gen)': Device('Mini (4th Gen)', '2015', 'dummy'),
  'Air (2nd Gen)': Device('Air (2nd Gen)', '2014', 'dummy'),
  'iPad (4th Gen)': Device('iPad (4th Gen)', '2014', 'dummy'),
  'Mini (3rd Gen)': Device('Mini (3rd Gen)', '2014', 'dummy'),
  'Air (1st Gen)': Device('Air (1st Gen)', '2013', 'dummy'),
  'Mini (2nd Gen)': Device('Mini (2nd Gen)', '2013', 'dummy'),
  'iPad (3rd Gen)': Device('iPad (3rd Gen)', '2012', 'dummy'),
  'Mini (1st Gen)': Device('Mini (1st Gen)', '2012', 'dummy'),
  'iPad (2nd Gen)': Device('iPad (2nd Gen)', '2011', 'dummy'),
  'iPad (1st Gen)': Device('iPad (1st Gen)', '2010', 'dummy'),
};

List<Display> ipadDisplays = [];

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
  Property(icons['display'], 'Display', 'Display P3 XDR Retina LCD'),
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
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '510 x 510 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '1092 x 510 px'),
  Iwidget(icons['large'], 'Large', '364 x 383 px', '1092 x 1149 px'),
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
  Property(icons['display'], 'Display', 'Display P3 XDR Retina LCD'),
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
  SizeClass(icons['twoThirdPortraitSplit'], '2/3 Portrait Split', 'Regular',
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
  Iwidget(icons['small'], 'Small', '170 x 170 px', '510 x 510 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '1092 x 510 px'),
  Iwidget(icons['large'], 'Large', '364 x 383 px', '1092 x 1149 px'),
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
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
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
      icons['halfLandscapeSplit'], '1/2 Landscape Split', 'Regular', 'Regular'),
  SizeClass(icons['oneThirdLandscapeSplit'], '1/3 Landscape Split', 'Compact',
      'Regular'),
  SizeClass(icons['landscapeSplideOver'], 'Landscape Slide Over', 'Compact',
      'Regular'),
], [
  Iwidget(icons['small'], 'Small', '170 x 170 px', '510 x 510 px'),
  Iwidget(icons['medium'], 'Medium', '364 x 170 px', '1092 x 510 px'),
  Iwidget(icons['large'], 'Large', '364 x 383 px', '1092 x 1149 px'),
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
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
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
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
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
  Iwidget(icons['large'], 'Large', '364 x 383 px', '728 x 764 px'),
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
  Property(icons['display'], 'Display', 'Display P3 Retina LCD'),
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
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
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
  Iwidget(icons['large'], 'Large', '364 x 383 px', '728 x 764 px'),
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
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD'),
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
