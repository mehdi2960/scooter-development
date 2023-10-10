import 'dart:convert';

class Tokens {
  Tokens({
    required this.authenticationToken,
    required this.accessToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      authenticationToken: json['authenticationToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );
  }

  factory Tokens.fromRawJson(Map<String, dynamic> json) =>
      Tokens.fromJson(json);

  final String? authenticationToken;
  final String? accessToken;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'authenticationToken': authenticationToken,
        'accessToken': accessToken,
      };
}
