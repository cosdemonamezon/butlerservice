import 'package:butlerservice/model/customer.dart';
import 'package:butlerservice/model/days.dart';
import 'package:butlerservice/model/location.dart';

class Job {
  int id;
  String customerId;
  String locationId;
  String name;
  String detail;
  DateTime startDate;
  DateTime endDate;
  String? createBy;
  String? updateBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  Customer? customer;
  Location? location;
  List<Days>? days;

  Job({
    required this.id,
    required this.customerId,
    required this.locationId,
    required this.name,
    required this.detail,
    required this.startDate,
    required this.endDate,
    this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.customer,
    this.location,
    this.days,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      customerId: json['customer_id'],
      locationId: json['location_id'],
      name: json['name'],
      detail: json['detail'],
      startDate: DateTime.parse(json['startdate']),
      endDate: DateTime.parse(json['enddate']),
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      customer: Customer.fromJson(json['customer']),
      location: Location.fromJson(json['location']),
      days: (json['days'] as List<dynamic>).map((e) => Days.fromJson(e)).toList(),
    );
  }
}
