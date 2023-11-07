import 'package:butlerservice/model/joblists.dart';

class Location {
  int? id;
  String? customerId;
  String? code;
  String? name;
  String? address;
  double? lat;
  double? lon;
  String? image;
  String? map;
  String? check_status;
  String? createBy;
  String? updateBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  List<Joplists>? job_lists;

  Location(
      {required this.id,
      required this.customerId,
      required this.code,
      required this.name,
      required this.address,
      required this.lat,
      required this.lon,
      required this.image,
      this.map,
      this.check_status,
      this.createBy,
      this.updateBy,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      this.job_lists});

  factory Location.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonJobLists = json['job_lists'] ?? <dynamic>[];

    List<Joplists>? jobLists = jsonJobLists.isNotEmpty
        ? jsonJobLists.map((job) => Joplists.fromJson(job)).toList()
        : null;

    return Location(
      id: json['id'],
      customerId: json['customer_id'],
      code: json['code'],
      name: json['name'],
      address: json['address'],
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
      image: json['image'],
      map: json['map'],
      check_status: json['check_status'],
      job_lists: jobLists,
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }
}
