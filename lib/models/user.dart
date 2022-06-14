import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  final String email;
  User({required this.email});
}
