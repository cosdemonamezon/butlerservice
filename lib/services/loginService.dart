import 'dart:convert';

import 'package:butlerservice/constants.dart';
import 'package:butlerservice/model/user.dart';
import 'package:butlerservice/utils/api_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginService {
  static Future<User> loginUsername(String username, String password) async {
    try {
      final url = Uri.parse('$baseUrl/api/login');
      final body = {
        'username': username,
        'password': password,
      };

      final response = await http.post(url, body: body);
      final jsonMessage = jsonDecode(response.body)['message'];
      final jsonBody = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200) {
        prefs.setString('token', jsonBody['token']);
        prefs.setString('userData', jsonEncode(jsonBody['data']));
        return User.fromJson(jsonBody['data']);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        if ((jsonBody is List)) {
          throw ApiException(jsonMessage);
        } else {
          throw ApiException('Failed to fetch data');
        }
      } else {
        throw ApiException('Failed to fetch data');
      }
    } on ApiException catch (e) {
      throw ApiException(e.message);
    }
  }
}
