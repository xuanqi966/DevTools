import '../device-attributes/property.dart';
import '../device-attributes/safe-area.dart';
import '../device-attributes/size-class.dart';
import '../device-attributes/iwidget.dart';
import '../devices/device.dart';

class Display {
  final String display;
  final String displayType;
  final String type; //Standard or Zoomed
  final List<Device> devices;
  final List<Property> properties;
  final List<Safearea> safeAreas;
  final List<SizeClass> sizeClasses;
  final List<Iwidget> widgets;

  Display(this.display, this.displayType, this.type, this.devices,
      this.properties, this.safeAreas, this.sizeClasses, this.widgets);
}
