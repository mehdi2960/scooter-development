import 'dart:convert';

import '/src/models/scooter.dart';

List<Vehicle> vehicleListFromJson(List<Map<String, dynamic>> list) {
  return List<Vehicle>.from(
    list.map((Map<String, dynamic> x) => Vehicle.fromJson(x)),
  );
}

class Vehicle {
  Vehicle({
    required this.scooter,
    // required this.etag,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        scooter: Scooter.fromJson(json['vehicle'] as Map<String, dynamic>),
        // etag: json['Etag'] as String?,
      );

  factory Vehicle.fromRawJson(Map<String, dynamic> json) =>
      Vehicle.fromJson(json);

  final Scooter? scooter;
  // final String? etag;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Vehicle': scooter?.toJson(),
        // 'Etag': etag,
      };

  @override
  String toString() {
    // return 'etag: $etag,
    return ' vehicle: $scooter';
  }
}
