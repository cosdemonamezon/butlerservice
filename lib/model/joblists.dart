class Joplists {
  int? id;
  String? job_time_id;
  String? work_title;
  String? work_desc;
  String? check_status;
  String? check_note;
  Joplists({
    required this.id,
    required this.job_time_id,
    required this.work_title,
    required this.work_desc,
    required this.check_status,
    required this.check_note,
  });

  factory Joplists.fromJson(Map<String, dynamic> json) {
    return Joplists(
      id: json['id'],
      job_time_id: json['job_time_id'],
      work_title: json['work_title'],
      work_desc: json['work_desc'],
      check_status: json['check_status'],
      check_note: json['check_status'],
    );
  }
}
