import 'dart:developer' as developer;
import 'package:get/get.dart';

abstract class IUtil {
  // logger
  void log(String message,
      {String tag = 'log', bool enableStackTrace = false, int level = 0});
}

class Util extends GetxController implements IUtil {
  factory Util() => instance;
  Util._();
  static final Util instance = Util._();

  @override
  void log(
    String message, {
    String tag = 'log',
    bool enableStackTrace = false,
    int level = 0,
  }) {
    if (enableStackTrace) {
      developer.log('$message',
          name: tag, stackTrace: StackTrace.current, level: level);
    } else {
      developer.log('$message', name: tag, level: level);
    }
  }
}
