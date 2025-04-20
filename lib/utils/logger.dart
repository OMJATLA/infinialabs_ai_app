import 'dart:developer';
import 'package:flutter/foundation.dart';

class Logger {
  const Logger._();

  static void printInDebug(dynamic message) {
    if (kDebugMode) {
      print(message.toString());
    }
  }

  static void logInDebug(dynamic message) {
    if (kDebugMode) {
      log(message.toString());
    }
  }
}
