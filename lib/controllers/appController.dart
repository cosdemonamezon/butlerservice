import 'package:butlerservice/model/user.dart';
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

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(prefs.get('token'));
    print(prefs.get('userData'));
    // pref?.getString('userData');
  }

  void logout() => prefs.clear();
}
