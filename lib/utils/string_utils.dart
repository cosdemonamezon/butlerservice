import 'package:flutter/material.dart';

class FormatString {
  static String? phoneNumber(String? phoneNumber) {
    final formattedNumber =
        '${phoneNumber?.substring(0, 3)}-${phoneNumber?.substring(3, 6)}-${phoneNumber?.substring(6, 10)}';
    return formattedNumber;
  }
}
