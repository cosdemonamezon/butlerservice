import 'package:intl/intl.dart';

class CustomNumberFormat {
  static String formatNumber(num value, {String currencySymbol = ''}) {
    NumberFormat formatter = NumberFormat('#,###.##');
    String formattedValue = formatter.format(value);
    return '$currencySymbol $formattedValue';
  }
}
