import 'package:flutter/foundation.dart';

class ExceptionOutput {
  static String dots = '----------------------------------------------------------';

  /// [Event] Print output exception
  static void output(Object exception) {
    if (exception is Exception) {
      if (kDebugMode) {
        print(dots);
        print('EXCEPTION CATCH ON LISTENER');
        print(dots);
        print(exception.runtimeType);
        print(dots);
        print(exception.toString());
        print(dots);
      }
    }
  }

  /// [Event] Print more details at exception
  static void details(String title, dynamic details) {
    if (kDebugMode) {
      print(dots);
      print(title);
      print(dots);
      print(details);
    }
  }
}
