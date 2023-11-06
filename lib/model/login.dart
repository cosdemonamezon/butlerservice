import 'package:butlerservice/model/user.dart';

class Login {
  String? code;
  bool status;
  String message;
  User user;
  String token;

  Login({
    required this.code,
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      user: User.fromJson(json['data']),
      token: json['token'],
    );
  }
}
