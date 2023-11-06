class UserTeam {
  int id;
  String? name;
  String? detail;
  String teamId;
  String userId;
  String? createBy;
  String? updateBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  UserTeam({
    required this.id,
    this.name,
    this.detail,
    required this.teamId,
    required this.userId,
    this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory UserTeam.fromJson(Map<String, dynamic> json) {
    return UserTeam(
      id: json['id'],
      name: json['name'],
      detail: json['detail'],
      teamId: json['team_id'],
      userId: json['user_id'],
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}
