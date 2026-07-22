class AuthModel {
  final String token;
  final String name;
  final String mobile;

  const AuthModel({
    required this.token,
    required this.name,
    required this.mobile,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final user = json['data']['user'];
    return AuthModel(
      token: json['data']['access_token'] ?? '',
      name: user['name'] ?? '',
      mobile: user['mobile'] ?? '',
    );
  }
}