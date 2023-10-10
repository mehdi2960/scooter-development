// class GeneralResponse {
//   GeneralResponse({
//     required this.errorMessage,
//     required this.status,
//     this.result,
//   });

//   factory GeneralResponse.fromJson(Map<String, dynamic> json) {
//     return GeneralResponse(
//       errorMessage: json['result'] as String,
//       status: json['status'] as int,
//       // status: Status.fromJson(json['status'] as Map<String, dynamic>),
//       result: json['result'] as dynamic,
//     );
//   }

//   final String errorMessage;
//   // final Status status;
//   final int status;
//   final dynamic result;

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'status': status,
//       'result': result,
//     };
//   }
// }

// class Status {
//   const Status({
//     required this.success,
//     required this.message,
//     required this.devMessage,
//     required this.statusCode,
//     required this.httpStatusCode,
//     required this.systemDateTime,
//     required this.systemTimeStamp,
//   });

//   factory Status.fromJson(Map<String, dynamic> json) {
//     return Status(
//       success: json['success'] as bool?,
//       message: json['message'] as String?,
//       devMessage: json['devMessage'] as String?,
//       statusCode: json['statusCode'] as int?,
//       httpStatusCode: json['httpStatusCode'] as int?,
//       systemDateTime: json['systemDateTime'] as String?,
//       systemTimeStamp: json['systemTimeStamp'] as int?,
//     );
//   }

//   final bool? success;
//   final String? message;
//   final String? devMessage;
//   final int? statusCode;
//   final int? httpStatusCode;
//   final String? systemDateTime;
//   final int? systemTimeStamp;

//   Map<String, dynamic> toJson() {
//     return <String, dynamic>{
//       'success': success,
//       'message': message,
//       'devMessage': devMessage,
//       'statusCode': statusCode,
//       'httpStatusCode': httpStatusCode,
//       'systemDateTime': systemDateTime,
//       'systemTimeStamp': systemTimeStamp,
//     };
//   }
// }

// To parse this JSON data, do

//     final generalResponse = generalResponseFromJson(jsonString);

class GeneralResponse {
  // Use dynamic for a nullable result

  GeneralResponse({
    required this.message,
    required this.status,
    this.result,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      message: json['message'] as String,
      status: json['status'] as int,
      result: json['result'],
    );
  }
  final String message;
  final int status;
  final dynamic result;
}
