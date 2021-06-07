import '../../models/devices/display.dart';
import '../displaypage/devicespage_icon.dart';
import '../../models/devices/device.dart';

class HomePageIcon {
  final String iconImageVal;
  final String imageName;
  final String nextPage;
  final List<Device> devicesList;
  Map<String, Device> phonesList;
  Map<int, List<Display>> displayList2;
  Map<int, List<Display>> displayList;

  HomePageIcon(
      {this.iconImageVal,
      this.imageName,
      this.nextPage,
      this.devicesList,
      this.displayList,
      this.phonesList,
      this.displayList2});
}
