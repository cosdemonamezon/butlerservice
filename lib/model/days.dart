import 'package:butlerservice/model/round_times.dart';

class Days {
  int id;
  String jobDetailId;
  DateTime workDate;
  String workStatus;
  String? createBy;
  String? updateBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  List<RoundTimes>? roundTimes;

  Days({
    required this.id,
    required this.jobDetailId,
    required this.workDate,
    required this.workStatus,
    this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.roundTimes,
  });

  factory Days.fromJson(Map<String, dynamic> json) {
    return Days(
      id: json['id'],
      jobDetailId: json['job_detail_id'],
      workDate: DateTime.parse(json['workdate']),
      workStatus: json['workstatus'],
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      roundTimes: (json['round_times'] as List<dynamic>).map((e) => RoundTimes.fromJson(e)).toList(),
    );
  }
}
