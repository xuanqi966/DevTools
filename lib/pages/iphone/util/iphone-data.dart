import 'package:dev_tools/models/devices/display.dart';
import '../../../models/devices/device.dart';
import '../../../models/device-attributes/property.dart';
import '../../../models/device-attributes/safe-area.dart';
import '../../../models/device-attributes/size-class.dart';
import '../../../models/device-attributes/iwidget.dart';
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

Map<int, List<Display>> displays = {
  0: [sixSevenS, sixSevenZ],
  1: [sixFiveXDRS, sixFiveXDRZ],
  2: [sixFiveS, sixFiveZ],
  3: [sixOneSuperRetinaS, sixOneSuperRetinaZ],
  4: [sixOneLiquidRetinaS, sixOneLiquidRetinaZ],
  5: [fiveEightXdrS, fiveEightXdrZ],
  6: [fiveEightS, fiveEightZ],
  7: [fiveFiveP3S, fiveFiveP3Z],
  8: [fiveFiveS, fiveFiveZ],
  9: [fiveFourS, fiveFourZ],
  10: [fourSevenDisplayP3S, fourSevenDisplayP3Z],
  11: [fourSevenS, fourSevenZ],
  12: [four, null],
  13: [threeFiveRetina, null],
  14: [threeFive, null]
};

Map<int, List<Display>> displays2 = {
  //12 Pro Max
  0: [sixSevenS, sixSevenZ],
  //12 Pro
  1: [sixOneSuperRetinaS, sixOneSuperRetinaZ],
  //12
  2: [sixOneSuperRetinaS, sixOneSuperRetinaZ],
  //12 mini
  3: [fiveFourS, fiveFourZ],
  //SE(2nd gen)
  4: [fourSevenDisplayP3S, fourSevenDisplayP3Z],
  //11 pro Max
  5: [sixFiveXDRS, sixFiveXDRZ],
  //11 pro
  6: [fiveEightXdrS, fiveEightXdrZ],
  //11
  7: [sixOneLiquidRetinaS, sixOneLiquidRetinaZ],
  //Xs Max
  8: [sixFiveS, sixFiveZ],
  //Xs
  9: [fiveEightS, fiveEightZ],
  //Xr
  10: [sixOneLiquidRetinaS, sixOneLiquidRetinaZ],
  //X
  11: [fiveEightS, fiveEightZ],
  //8 Plus
  12: [fiveFiveP3S, fiveFiveP3Z],
  //8
  13: [fourSevenDisplayP3S, fourSevenDisplayP3Z],
  //7 plus
  14: [fiveFiveP3S, fiveFiveP3Z],
  //7
  15: [fourSevenDisplayP3S, fourSevenDisplayP3Z],
  //6s Plus
  16: [fiveFiveS, fiveFiveZ],
  //6s
  17: [fourSevenS, fourSevenZ],
  //6 plus
  18: [fiveFiveS, fiveFiveZ],
  //6
  19: [fourSevenS, fourSevenZ],
  //SE(1st gen)
  20: [four, null],
  //5s
  21: [four, null],
  //5c
  22: [four, null],
  //5
  23: [four, null],
  //4s
  24: [threeFiveRetina, null],
  //4
  25: [threeFiveRetina, null],
  //3gs
  26: [threeFive, null],
  //3g
  27: [threeFive, null],
  //iPhone
  28: [threeFive, null],
};

Display sixSevenS = Display('6.7\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 428 x 926 px',
      '@3x: 1284 x 2778 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 47 px',
      '@3x: 141 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '@1x: 210 x 32 px',
      '@3x: 630 x 96 px px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 109 x 32 px', '@3x: 327 x 96 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 170 x 170 px', '@3x: 510 x 510 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 364 x 170 px', '@3x: 1092 x 510 px'),
  Iwidget(icons['large'], 'Large', '@1x: 364 x 383 px', '@3x: 1092 x 1149 px'),
]);

Display sixSevenZ = Display('6.7\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 41 px',
      '@3x: 123 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 30 px', '@3x: 90 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '@1x: 185 x 28 px',
      '@3x: 555 x 84 px px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 95 x 28 px', '@3x: 285 x 84 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 177 x 177 px', '@3x: 531 x 531 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 376 x 177 px', '@3x: 1128 x 531 px'),
  Iwidget(icons['large'], 'Large', '@1x: 376 x 394 px', '@3x: 1128 x 1182 px'),
]);

Display sixFiveXDRZ =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['11 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 40 px',
      '@3x: 120 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 31 px', '@3x: 93 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '@1x: 189 x 27 px',
      '@3x: 567 x 81 px px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 93 x 27 px', '@3x: 279 x 81 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 172 x 172 px', '@3x: 516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 364 x 172 px', '@3x: 1092 x 516 px'),
  Iwidget(icons['large'], 'Large', '@1x: 364 x 381 px', '@3x: 1092 x 1143 px'),
]);

Display sixFiveXDRS =
    Display('6.5\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 414 x 896 px',
      '@3x: 1242 x 2688 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 44 px',
      '@3x: 132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 210 x 30 px', '@3x: 630 x 90 px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 102 x 30 px', '@3x: 306 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 169 x 169 px', '@3x: 507 x 507 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 360 x 169 px', '@3x: 1080 x 507 px'),
  Iwidget(icons['large'], 'Large', '@1x: 360 x 379 px', '@3x: 1080 x 1137 px'),
]);

Display sixFiveS = Display('6.5\"', "Display P3 XDR Retina OLED", "Standard", [
  iphones['XS Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 414 x 896 px',
      '@3x: 1242 x 2688 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED', '6.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 44 px',
      '@3x: 132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 210 x 30 px', '@3x: 630 x 90 px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 102 x 30 px', '@3x: 306 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 169 x 169 px', '@3x: 507 x 507 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 360 x 169 px', '@3x: 1080 x 507 px'),
  Iwidget(icons['large'], 'Large', '@1x: 360 x 379 px', '@3x: 1080 x 1137 px'),
]);

Display sixFiveZ = Display('6.5\"', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['XS Max']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED', '6.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 40 px',
      '@3x: 120 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 31 px', '@3x: 93 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '1@1x: 89 x 27 px', '@3x: 567 x 81 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 93 x 27 px', '@3x: 279 x 81 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 172 x 172 px', '@3x: 516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 364 x 172 px', '@3x: 1092 x 516 px'),
  Iwidget(icons['large'], 'Large', '@1x: 364 x 381 px', '@3x: 1092 x 1143 px'),
]);

Display sixOneSuperRetinaS =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Standard", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 390 x 844 px',
      '@3x: 1170 x 2532 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '460'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.1\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 47 px',
      '@3x: 141 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 212 x 32 px', '@3x: 636 x 96 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 89 x 32 px', '@3x: 267 x 96 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 158 x 158 px', '@3x: 474 x 474 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 338 x 158 px', '@3x: 1014 x 474 px'),
  Iwidget(icons['large'], 'Large', '@1x: 338 x 354 px', '@3x: 1014 x 1062 px'),
]);
Display sixOneSuperRetinaZ =
    Display('6.1\" Super Retina', "Display P3 XDR Retina OLED", "Zoomed", [
  iphones['12 Pro'],
  iphones['12']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 693 px',
      '@3x: 960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '460'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '6.1\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 39 px',
      '@3x: 117 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 28 px', '@3x: 84 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 172 x 26 px', '@3x: 516 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 74 x 26 px', '@3x: 222 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 172 x 172 px', '@3x: 516 x 516 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 356 x 172 px', '@3x: 1068 x 516 px'),
  Iwidget(icons['large'], 'Large', '@1x: 356 x 379 px', '@3x: 1068 x 1137 px'),
]);

Display sixOneLiquidRetinaS =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Standard", [
  iphones['11'],
  iphones['XR']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 414 x 896 px',
      '@2x: 828 x 1792 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display R3 Retina LCD', '6.1\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 48 px',
      '@2x: 96 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@2x: 68 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@2x: 42 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 212 x 32 px', '@2x: 424 x 64 px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 101 x 32 px', '@2x: 202 x 64 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 158 x 158 px', '@2x: 316 x 316 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 338 x 158 px', '@2x: 676 x 316 px'),
  Iwidget(icons['large'], 'Large', '@1x: 338 x 354 px', '@2x: 676 x 708 px'),
]);
Display sixOneLiquidRetinaZ =
    Display('6.1\" Liquid Retina', "Display R3 Retina LCD", "Zoomed", [
  iphones['11'],
  iphones['XR']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@2x: 750 x 1624 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display R3 Retina LCD', '6.1\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 44 px',
      '@2x: 88 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 31 px', '@2x: 62 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '42 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 172 x 26 px', '@2x: 344 x 52 px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 101.5 x 26 px', '@2x: 203 x 52 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 172 x 172 px', '@2x: 344 x 344 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 356 x 172 px', '@2x: 712 x 344 px'),
  Iwidget(icons['large'], 'Large', '@1x: 356 x 379 px', '@2x: 712 x 758 px'),
]);

Display fiveEightXdrS =
    Display('5.8\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro'],
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', "Display P3 XDR Retina OLED", '5.8\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 44 px',
      '@3x: 132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 209 x 30 px', '@3x: 627 x 90 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 83 x 30 px', '@3x: 249 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 155 x 155 px', '@3x: 465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 329 x 155 px', '@3x: 987 x 465 px'),
  Iwidget(icons['large'], 'Large', '@1x: 329 x 345 px', '@3x: 987 x 1035 px'),
]);
Display fiveEightXdrZ =
    Display('5.8\" XDR', "Display P3 XDR Retina OLED", "Standard", [
  iphones['11 Pro'],
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 693 px',
      '@3x: 960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 XDR Retina OLED', '5.8\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 38 px',
      '@3x: 114 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 29 px', '@3x: 87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 178 x 26 px', '@3x: 534 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 71 x 26 px', '@3x: 213 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 165 x 165 px', '@3x: 495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 343 x 165 px', '@3x: 1029 x 495 px'),
  Iwidget(icons['large'], 'Large', '@1x: 343 x 364 px', '@3x: 1029 x 1092 px'),
]);
Display fiveEightS = Display('5.8\"', "Display P3 Retina OLED", "Standard", [
  iphones['XS'],
  iphones['X']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED', '5.8\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 44 px',
      '132 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 209 x 30 px', '@3x: 627 x 90 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 83 x 30 px', '@3x: 249 x 90 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 155 x 155 px', '@3x: 465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 329 x 155 px', '@3x: 987 x 465 px'),
  Iwidget(icons['large'], 'Large', '@1x: 329 x 345 px', '@3x: 987 x 1035 px'),
]);
Display fiveEightZ = Display('5.8\"', "Display P3 Retina OLED", "Zoomed", [
  iphones['XS'],
  iphones['X']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 693 px',
      '@3x: 960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '458'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina OLED', '5.8\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 38 px',
      '@3x: 114 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 29 px', '@3x: 87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 178 x 26 px', '@3x: 534 x 78 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 71 x 26 px', '@3x: 213 x 78 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 165 x 165 px', '@3x: 495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 343 x 165 px', '@3x: 1029 x 495 px'),
  Iwidget(icons['large'], 'Large', '@1x: 343 x 364 px', '@3x: 1029 x 1092 px'),
]);
Display fiveFiveP3S =
    Display('5.5\" Display P3', "Display P3 Retina LCD", "Standard", [
  iphones['8 Plus'],
  iphones['7 Plus']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 414 x 736 px',
      '@3x: 1242 x 2208 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '5.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@3x: 60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 157 x 157 px', '@3x: 471 x 471 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 348 x 157 px', '@3x: 1044 x 471 px'),
  Iwidget(icons['large'], 'Large', '@1x: 348 x 352 px', '@3x: 1044 x 1056 px'),
]);
Display fiveFiveP3Z =
    Display('5.5\" Display P3', "Display P3 Retina LCD", "Zoomed", [
  iphones['8 Plus'],
  iphones['7 Plus']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 667 px',
      '@3x: 1125 x 2001 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '5.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@3x: 60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
Display fiveFiveS = Display('5.5\"', "sRGB Retina LCD", "Standard", [
  iphones['6s Plus'],
  iphones['6 Plus']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 414 x 736 px',
      '@3x: 1242 x 2208 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '5.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@3x: 60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 157 x 157 px', '@3x: 471 x 471 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 348 x 157 px', '@3x: 1044 x 471 px'),
  Iwidget(icons['large'], 'Large', '@1x: 348 x 352 px', '@3x: 1044 x 1056 px'),
]);
Display fiveFiveZ = Display('5.5\"', "sRGB Retina LCD", "Zoomed", [
  iphones['6s Plus'],
  iphones['6 Plus']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 667 px',
      '@3x: 1125 x 2001 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '401'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,300:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGB Retina LCD', '5.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@3x: 60 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Regular', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 163 x 163 px', '@3x: 489 x 489 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 354 x 163 px', '@3x: 1062 x 489 px'),
  Iwidget(icons['large'], 'Large', '@1x: 354 x 357 px', '@3x: 1062 x 1071 px'),
]);
Display fiveFourS = Display('5.4\"', "Display XDR P3 Retina OLED", "Standard", [
  iphones['12 mini']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 812 px',
      '@3x: 1125 x 2436 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '476'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display XDR P3 Retina OLED', '5.4\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 50 px',
      '@3x: 150 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 34 px', '@3x: 102 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(icons['notchSize'], 'Notch Size', '@1x: 227 x 34 px',
      '@3x: 681 x 102 px'),
  Safearea(
      icons['earSize'], 'Ear Size', '@1x: 74 x 34 px', '@3x: 222 x 102 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 155 x 155 px', '@3x: 465 x 465 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 329 x 155 px', '@3x: 987 x 465 px'),
  Iwidget(icons['large'], 'Large', '@1x: 329 x 345 px', '@3x: 987 x 1035 px'),
]);
Display fiveFourZ = Display('5.4\"', "Display XDR P3 Retina OLED", "Zoomed", [
  iphones['12 mini']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 693 px',
      '@3x: 960 x 2079 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '476'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '19.5:9'),
  Property(icons['contrast'], 'Contrast Ratio', '2,000,000:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display XDR P3 Retina OLED', '5.4\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 43 px',
      '@3x: 129 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@3x: 0 px'),
  Safearea(icons['portraitHomeIndicator'], 'Portrait Home Indicator',
      '@1x: 29 px', '@3x: 87 px'),
  Safearea(icons['landscapeHomeIndicator'], 'Landscape Home Indicator',
      '@1x: 21 px', '@3x: 63 px'),
  Safearea(
      icons['notchSize'], 'Notch Size', '@1x: 192 x 29 px', '@3x: 576 x 87 px'),
  Safearea(icons['earSize'], 'Ear Size', '@1x: 64 x 29 px', '@3x: 192 x 87 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 165 x 165 px', '@3x: 495 x 495 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 342 x 165 px', '@3x: 1026 x 495 px'),
  Iwidget(icons['large'], 'Large', '@1x: 342 x 364 px', '@3x: 1026 x 1092 px'),
]);

Display fourSevenDisplayP3S =
    Display('4.7\" Display P3', "Display P3 Retina LCD", "Standard", [
  iphones['SE (2nd Gen)'],
  iphones['8'],
  iphones['7']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 667 px',
      '@2x: 750 x 1334 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '4.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 148 x 148 px', '@2x: 296 x 296 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 321 x 148 px', '@2x: 642 x 296 px'),
  Iwidget(icons['large'], 'Large', '@1x: 321 x 325 px', '@2x: 642 x 650 px'),
]);
Display fourSevenDisplayP3Z =
    Display('4.7\" Display P3', "Display P3 Retina LCD", "Zoomed", [
  iphones['SE (2nd Gen)'],
  iphones['8'],
  iphones['7']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 568 px',
      '@2x: 640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Supported'),
  Property(icons['display'], 'Display', 'Display P3 Retina LCD', '4.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 166 x 166 px', '@2x: 332 x 332 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 343 x 166 px', '@2x: 686 x 332 px'),
  Iwidget(icons['large'], 'Large', '@1x: 343 x 365 px', '@2x: 686 x 730 px'),
]);

Display fourSevenS = Display('4.7\"', "sRGD Retina LCD", "Standard", [
  iphones['6s'],
  iphones['6']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 375 x 667 px',
      '@2x: 750 x 1334 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD', '4.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 148 x 148 px', '@2x: 296 x 296 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 321 x 148 px', '@2x: 642 x 296 px'),
  Iwidget(icons['large'], 'Large', '@1x: 321 x 325 px', '@2x: 642 x 650 px'),
]);
Display fourSevenZ = Display('4.7\"', "sRGD Retina LCD", "Zoomed", [
  iphones['6s'],
  iphones['6']
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 568 px',
      '@2x: 640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '1,400:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD', '4.7\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 166 x 166 px', '@2x: 332 x 332 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 343 x 166 px', '@2x: 686 x 332 px'),
  Iwidget(icons['large'], 'Large', '@1x: 343 x 365 px', '@2x: 686 x 730 px'),
]);

Display four = Display('4\"', "sRGD Retina LCD", "Standard", [
  iphones['SE (1st Gen)'],
  iphones['5s'],
  iphones['5c'],
  iphones['5'],
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 568 px',
      '@2x: 640 x 1136 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 14'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '16:9'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD', '4\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], [
  Iwidget(icons['small'], 'Small', '@1x: 141 x 141 px', '@2x: 282 x 282 px'),
  Iwidget(icons['medium'], 'Medium', '@1x: 292 x 141 px', '@2x: 584 x 282 px'),
  Iwidget(icons['large'], 'Large', '@1x: 292 x 312 px', '@2x: 584 x 624 px'),
]);
Display threeFiveRetina =
    Display('3.5\" Retina', "sRGD Retina LCD", "Standard", [
  iphones['4s'],
  iphones['4'],
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 480 px',
      '@2x: 640 x 960 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 9'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '3:2'),
  Property(icons['contrast'], 'Contrast Ratio', '800:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD Retina LCD', '3.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px',
      '@2x: 40 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px',
      '@2x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
Display threeFive = Display('3.5\"', "sRGD LCD", "Standard", [
  iphones['3GS'],
  iphones['3G'],
  iphones['iPhone'],
], [
  Property(icons['resolution'], 'Resolution', '@1x: 320 x 480 px'),
  Property(icons['ios'], 'Last Supported By', 'iOS 6'),
  Property(icons['ppi'], 'PPI', '326'),
  Property(icons['aspectRatio'], 'Aspect Ratio', '3:2'),
  Property(icons['contrast'], 'Contrast Ratio', '200:1'),
  Property(icons['trueTone'], 'True Tone', 'Not Supported'),
  Property(icons['display'], 'Display', 'sRGD LCD', '3.5\"'),
], [
  Safearea(icons['portraitStatusBar'], 'Portrait Status Bar', '@1x: 20 px'),
  Safearea(icons['landscapeStatusBar'], 'Landscape Status Bar', '@1x: 0 px'),
], [
  SizeClass(icons['portrait'], 'Portrait', 'Compact', 'Regular'),
  SizeClass(icons['landscape'], 'Landscape', 'Compact', 'Compact'),
], []);
