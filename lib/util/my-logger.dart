import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: MyLogPrinter(className));
}

class MyLogPrinter extends LogPrinter {
  final String className;

  MyLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    // TODO: implement log
    var color = PrettyPrinter.levelColors[event.level];
    var emoji = PrettyPrinter.levelEmojis[event.level];
    return [color('$emoji $className - ${event.message}')];
  }
}
