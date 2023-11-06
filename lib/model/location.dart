class Location {
  int id;
  String customerId;
  String code;
  String name;
  String address;
  double lat;
  double lon;
  String image;
  String? createBy;
  String? updateBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Location({
    required this.id,
    required this.customerId,
    required this.code,
    required this.name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.image,
    this.createBy,
    this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      customerId: json['customer_id'],
      code: json['code'],
      name: json['name'],
      address: json['address'],
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
      image: json['image'],
      createBy: json['create_by'],
      updateBy: json['update_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}
