import 'dart:convert';

List<Scooter> scooterListFromJson(List<Map<String, dynamic>> list) {
  return List<Scooter>.from(
    list.map((Map<String, dynamic> x) => Scooter.fromJson(x)),
  );
}

class Scooter {
  Scooter({
    required this.id,
    required this.short,
    required this.imei,
    required this.name,
    required this.zone,
    required this.type,
    required this.status,
    required this.bounty,
    required this.location,
    required this.battery,
    required this.locked,
    required this.updated,
    required this.mileage,
  });

  factory Scooter.fromJson(Map<String, dynamic> json) {
    return Scooter(
      id: json['id'] as String?,
      short: json['short'] as String?,
      imei: json['imei'] as String?,
      name: json['name'] as String?,
      zone: json['zone'] as int?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      bounty: json['pickup'] as int?,
      location: json['location'] != null
          ? List.from((json['location'] as List<dynamic>).map((x) {
              if (x is int) {
                return x.toDouble();
              }
              return x;
            }))
          : <double>[],
      battery: json['battery'] as int?,
      locked: json['locked'] as bool? ?? false,
      updated: json['updated'] != null
          ? DateTime.parse(json['updated'] as String)
          : null,
      mileage: json['mileage'] as int?,
    );
  }

  factory Scooter.fromRawJson(Map<String, dynamic> json) =>
      Scooter.fromJson(json);

  final String? id;
  final String? short;
  final String? imei;
  final String? name;
  final int? zone;
  final String? type;
  final String? status;
  final int? bounty;
  final List<double> location;
  final int? battery;
  final bool locked;
  final DateTime? updated;
  final int? mileage;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'short': short,
        'imei': imei,
        'name': name,
        'zone': zone,
        'type': type,
        'status': status,
        'pickup': bounty,
        'location': List<dynamic>.from(location.map((double x) => x)),
        'battery': battery,
        'locked': locked,
        'updated': updated?.toIso8601String(),
        'mileage': mileage,
      };

  @override
  String toString() {
    return 'id: $id, short: $short , imei: $imei , name : $name , zone: $zone type : $type , status : $status , bounty: $bounty, location : $location , battery : $battery , locked : $locked , updated : $updated , mileage : $mileage  ';
  }
}
