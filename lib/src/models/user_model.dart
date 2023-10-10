class User {
  User({
    required this.id,
    required this.country,
    required this.email,
    required this.name,
    required this.phone,
    required this.profile,
    required this.authLevel,
    required this.addedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      profile: json['profile'] as String,
      authLevel: json['authLevel'] as String,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }

  final String id;
  final String country;
  final String email;
  final String name;
  final String phone;
  final String profile;
  final String authLevel;
  final DateTime addedAt;
}
