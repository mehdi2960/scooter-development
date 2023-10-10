List<Ride> rideListFromJson(List<Map<String, dynamic>> list) {
  return List<Ride>.from(
      list.map((Map<String, dynamic> x) => Ride.fromJson(x)));
}

class Ride {
  Ride({
    required this.id,
    required this.accountId,
    required this.vehicleId,
    required this.vehicleShort,
    required this.zoneId,
    required this.lockCount,
    required this.startTime,
    required this.startLoc,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      vehicleId: json['vehicleId'] as String,
      vehicleShort: json['vehicleShort'] as String,
      zoneId: json['zoneId'] as String,
      lockCount: json['lockCount'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      startLoc: (json['startLoc'] as List<dynamic>)
          .map((x) => x is num ? x.toDouble() : 0.0)
          .toList(),
    );
  }

  final String id;
  final String accountId;
  final String vehicleId;
  final String vehicleShort;
  final String zoneId;
  final int lockCount;
  final DateTime startTime;
  final List<double> startLoc;
}
