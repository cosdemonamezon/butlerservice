import 'package:butlerservice/screens/auth/widgets/globals.dart';
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  get isValid => _isValid;
  bool _isValid = false;
  // void isValidEmail(String input) {
  //   if (input == Global.validEmail.first) {
  //     _isValid = true;
  //   } else {
  //     _isValid = false;
  //   }
  //   notifyListeners();
  // }
}