import '../../models/devices/display.dart';
import '../displaypage/devicespage_icon.dart';

class HomePageIcon {
  final String iconImageVal;
  final String imageName;
  final String nextPage;
  final List<DevicesIcon> devicesList;
  List<Display> displayList;

  HomePageIcon(
      {this.iconImageVal,
      this.imageName,
      this.nextPage,
      this.devicesList,
      this.displayList});
}
