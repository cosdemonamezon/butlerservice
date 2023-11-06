import 'package:butlerservice/model/job.dart';
import 'package:butlerservice/model/team.dart';
import 'package:butlerservice/model/user_team.dart';

class User {
  int id;
  String permissionId;
  String username;
  String name;
  String nickname;
  String email;
  String phone;
  String image;
  String status;
  String createBy;
  String? updateBy;
  String createdAt;
  String updatedAt;
  UserTeam? userTeam;
  Team? team;
  Job? job;

  User({
    required this.id,
    required this.permissionId,
    required this.username,
    required this.name,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.image,
    required this.status,
    required this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.userTeam,
    this.team,
    this.job,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      permissionId: json['permission_id'],
      username: json['username'],
      name: json['name'],
      nickname: json['nickname'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      status: json['status'],
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userTeam: UserTeam.fromJson(json['user_team']),
      team: Team.fromJson(json['team']),
      job: Job.fromJson(json['jobs']),
    );
  }
}
