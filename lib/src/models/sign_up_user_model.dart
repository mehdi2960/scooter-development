class SignUpUserModel {
  SignUpUserModel({this.status, this.result});

  SignUpUserModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] is Map) {
      status = json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>);
    }
    if (json['result'] is Map) {
      result = json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>);
    }
  }

  Status? status;
  Result? result;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status?.toJson();
    }
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class Result {
  Result({this.userId, this.otpId, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['userId'] is String) {
      userId = json['userId'] as String;
    }
    if (json['otpId'] is String) {
      otpId = json['otpId'] as String;
    }
    if (json['message'] is String) {
      message = json['message'] as String;
    }
  }

  String? userId;
  String? otpId;
  String? message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['otpId'] = otpId;
    data['message'] = message;
    return data;
  }
}

class Status {
  Status(
      {this.message,
      this.devMessage,
      this.success,
      this.httpStatusCode,
      this.systemDateTime,
      this.timeStamp});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['message'] is String) {
      message = json['message'] as String;
    }
    devMessage = json['devMessage'] as dynamic;
    if (json['success'] is bool) {
      success = json['success'] as bool;
    }
    if (json['httpStatusCode'] is int) {
      httpStatusCode = json['httpStatusCode'] as int;
    }
    if (json['systemDateTime'] is String) {
      systemDateTime = json['systemDateTime'] as String;
    }
    if (json['timeStamp'] is int) {
      timeStamp = json['timeStamp'] as int;
    }
  }

  String? message;
  dynamic devMessage;
  bool? success;
  int? httpStatusCode;
  String? systemDateTime;
  int? timeStamp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['devMessage'] = devMessage;
    data['success'] = success;
    data['httpStatusCode'] = httpStatusCode;
    data['systemDateTime'] = systemDateTime;
    data['timeStamp'] = timeStamp;
    return data;
  }
}
