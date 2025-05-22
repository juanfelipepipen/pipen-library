import 'package:intl/intl.dart';

extension StringExtension on String {
  /// Convert int to double
  int toInt() => int.parse(this);

  /// Try convert int to double
  int? tryToInt() => int.tryParse(this);

  /// Convert string to double
  double toDouble() => double.parse(this);

  /// Convert string to double or null
  double? tryToDouble() => double.tryParse(this);

  /// Convert string to bool
  bool toBool() => bool.parse(this);

  /// Try convert string to bool
  bool? tryToBool() => bool.tryParse(this);

  /// Convert string to datetime
  DateTime toDateTime() => DateTime.parse(this);

  /// Convert string to datetime
  DateTime toDateTimeLocal() => toDateTime().toLocal();

  /// Convert string to datetime
  DateTime? tryDateTime() => DateTime.tryParse(this);

  /// Parse date by format
  DateTime dateByFormat(String format) {
    DateFormat formatter = DateFormat(format);
    return formatter.parse(this);
  }

  /// To upper case the first letter
  String get firstUpper {
    if (isNotEmpty) {
      return this[0].toUpperCase() + substring(1);
    }
    return this;
  }

  /// To upper case the first letter and other lower case
  String get normalize {
    if (isNotEmpty) {
      return this[0].toUpperCase() + substring(1).toLowerCase();
    }
    return this;
  }
}
