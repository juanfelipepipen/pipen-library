import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Get datetime format for api requests
  String get requestDateTime => DateFormat("yyyy-MM-ddTHH:mm:ss'Z'").format(this);

  /// Get datetime format for api requests
  String get requestDate => DateFormat("yyyy-MM-dd").format(this);

  /// Get only date
  String get toDateLabel => DateFormat("dd/MM/yyyy").format(this);

  /// Get date and time
  String get toDateTimeLabel => '$toDateLabel $hourLabel';

  /// Get datetime hour formatted
  String get hourLabel => DateFormat("hh:mm aa").format(this);

  /// Get month label
  String get monthLabel => DateFormat('MMMM', 'es').format(this).toString();

  /// Format date time
  String formatter(String format) => DateFormat(format, 'es_ES').format(this);

  /// Compare only year, month and number day
  bool isSameDate(DateTime date) => (date.year == year && date.month == month && date.day == day);
}
