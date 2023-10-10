class EndRideModel {
  EndRideModel({
    required this.id,
    required this.accountId,
    required this.vehicleId,
    required this.vehicleShort,
    required this.zoneId,
    required this.lockCount,
    required this.manualEnd,
    required this.startTime,
    required this.startLoc,
    required this.startAddr,
    required this.end,
    required this.endLoc,
    required this.endAddr,
    required this.credit,
    required this.cost,
    required this.vat,
    required this.currency,
    required this.success,
    required this.transactionId,
    required this.company,
    required this.orgnr,
    required this.invoiceLink,
  });

  factory EndRideModel.fromJson(Map<String, dynamic> json) {
    return EndRideModel(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      vehicleId: json['vehicleId'] as String,
      vehicleShort: json['vehicleShort'] as String,
      zoneId: json['zoneId'] as String,
      lockCount: json['lockCount'] as int,
      manualEnd: json['manualEnd'] as bool,
      startTime: DateTime.parse(json['startTime'] as String),
      startLoc: (json['startLoc'] as List<dynamic>)
          .map((x) => x is num ? x.toDouble() : 0.0)
          .toList(),
      startAddr: json['startAddr'] as String,
      end: DateTime.parse(json['end'] as String),
      endLoc: (json['endLoc'] as List<dynamic>)
          .map((x) => x is num ? x.toDouble() : 0.0)
          .toList(),
      endAddr: json['endAddr'] as String,
      credit: json['credit'] as int,
      cost: json['cost'] as int,
      vat: json['vat'] as double,
      currency: json['currency'] as String,
      success: json['success'] as bool,
      transactionId: json['transactionId'] as String,
      company: json['company'] as String,
      orgnr: json['orgnr'] as String,
      invoiceLink: json['invoiceLink'] as String,
    );
  }
  final String id;
  final String accountId;
  final String vehicleId;
  final String vehicleShort;
  final String zoneId;
  final int lockCount;
  final bool manualEnd;
  final DateTime startTime;
  final List<double> startLoc;
  final String startAddr;
  final DateTime end;
  final List<double> endLoc;
  final String endAddr;
  final int credit;
  final int cost;
  final double vat;
  final String currency;
  final bool success;
  final String transactionId;
  final String company;
  final String orgnr;
  final String invoiceLink;
}
