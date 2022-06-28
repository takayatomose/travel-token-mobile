class AuthCredentials {
  final int id;
  final String email;
  final String fullName;
  final String refCode;
  final String profileAvatar;
  final String token;
  final String refreshToken;
  AuthCredentials(
      {required this.id,
      required this.email,
      required this.refCode,
      required this.token,
      required this.refreshToken,
      this.fullName = '',
      this.profileAvatar = ''});
  factory AuthCredentials.fromJson(Map<String, dynamic> json) {
    return AuthCredentials(
        id: json['id'] as int,
        email: json['email'] as String,
        refCode: json['refCode'] as String,
        token: json['token'] as String,
        refreshToken: json['refreshToken'] as String,
        profileAvatar: json['profileAvatar'] as String,
        fullName: json['fullName'] as String);
  }
}
