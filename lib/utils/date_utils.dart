import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatTo(String pattern) {
    final format = DateFormat(pattern, 'th');
    return format.format(toLocal());
  }
}
