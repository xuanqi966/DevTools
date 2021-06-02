import 'package:dev_tools/models/devices/display.dart';
import 'package:flutter/material.dart';

import '../../models/devices/device.dart';
import '../../models/device-attributes/property.dart';
import '../../models/device-attributes/safe-area.dart';
import '../../models/device-attributes/size-class.dart';
import '../../models/device-attributes/iwidget.dart';
import '../../models/device-attributes/multitasking.dart';

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
