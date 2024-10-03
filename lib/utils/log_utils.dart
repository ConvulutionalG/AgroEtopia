import 'package:flutter/foundation.dart';

showLogs(String name, String value) {
  if (kDebugMode) {
    print("$name==>>    $value");
  }
}
