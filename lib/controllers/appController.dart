import 'dart:convert';

import 'package:butlerservice/model/location.dart';
import 'package:butlerservice/model/user.dart';
import 'package:butlerservice/services/loginService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends ChangeNotifier {
  String? token;
  String? id;
  String? image;
  String? name;
  String? nickname;
  bool? statusA;
  User? user;
  late SharedPreferences prefs;

  Location? location;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token') && prefs.containsKey('userData')) {
      token = prefs.getString('token');
      user = User.fromJson(jsonDecode(prefs.getString('userData')!));
			notifyListeners();
    }
  }

  getlocation(String code) async {
    location = await LoginService.scanLocation(code);
    notifyListeners();
  }

  void logout() => prefs.clear();
}
