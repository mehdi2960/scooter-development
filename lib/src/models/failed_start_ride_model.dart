class FailedStartRide {
  FailedStartRide({
    required this.code,
    required this.internal,
    required this.message,
  });

  factory FailedStartRide.fromJson(Map<String, dynamic> json) {
    return FailedStartRide(
      code: json['code'] as String,
      internal: json['internal'] as String,
      message: json['message'] as String,
    );
  }
  final String code;
  final String internal;
  final String message;
}
