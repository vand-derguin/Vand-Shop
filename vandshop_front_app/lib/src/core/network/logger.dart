import 'package:logger/logger.dart';

// Logging interceptor for Dio HTTP client
var logger = Logger(printer: SimpleLogPrinter(className: "VandShop"));

class SimpleLogPrinter extends LogPrinter {
  final String? className;
  SimpleLogPrinter({this.className});

  @override
  List<String> log(LogEvent event) {
    return ['[$className] ${event.message}'];
  }
}
