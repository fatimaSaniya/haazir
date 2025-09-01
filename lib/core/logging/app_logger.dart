
import 'dart:developer' as dev;

class Log {
  static void d(String message, {Object? error, StackTrace? stackTrace}) {
    dev.log(message, name: 'DEBUG', error: error, stackTrace: stackTrace);
  }

  static void e(String message, {Object? error, StackTrace? stackTrace}) {
    dev.log(message, name: 'ERROR', error: error, stackTrace: stackTrace);
  }
}
