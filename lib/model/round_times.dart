class RoundTimes {
  int id;
  String jobDayId;
  DateTime day;
  String time;
  String? name;
  String? remark;
  String lat;
  String lon;
  String map;
  String checkStatus;
  String? checkNote;
  String? createBy;
  String? updateBy;
  String createdAt;
  String updatedAt;
  DateTime? deletedAt;

  RoundTimes({
    required this.id,
    required this.jobDayId,
    required this.day,
    required this.time,
    this.name,
    this.remark,
    required this.lat,
    required this.lon,
    required this.map,
    required this.checkStatus,
    this.checkNote,
    this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory RoundTimes.fromJson(Map<String, dynamic> json) {
    return RoundTimes(
      id: json['id'],
      jobDayId: json['job_day_id'],
      day: DateTime.parse(json['day']),
      time: json['time'],
      name: json['name'],
      remark: json['remark'],
      lat: json['lat'],
      lon: json['lon'],
      map: json['map'],
      checkStatus: json['check_status'],
      checkNote: json['check_note'],
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}
