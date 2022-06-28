import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final String fullName;
  final String profileAvatar;
  UserModel({required this.email, this.fullName = '', this.profileAvatar = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String,
        fullName: json['fullName'] as String,
        profileAvatar: json['profileAvatar'] as String,
      );
}
