TokenModel signUpUserFromJson(Map<String, dynamic> json) =>
    TokenModel.fromJson(json);

class TokenModel {
  TokenModel({
    required this.token,
    required this.message,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'] as String?, message: json['message'] as String?);

  String? token;
  String? message;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'token': token, 'message': message};
}
