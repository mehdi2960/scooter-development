class OTP {
  OTP({
    required this.errorMessage,
    required this.status,
    required this.result,
  });

  factory OTP.fromJson(Map<String, dynamic> json) {
    return OTP(
      errorMessage: json['errorMessage'] as String,
      status: json['status'] as int,
      result: json['result'] as Map<String, dynamic>,
    );
  }

  final String errorMessage;
  final int status;
  final Map<String, dynamic> result;
}
