import 'package:xtrip_mobile/utils/number.dart';

class UserPlayAttributes {
  final double luck;
  final double efficiency;
  final double distance;
  final double lifetime;
  final double recovery;
  const UserPlayAttributes(
      {this.luck = 0,
      this.distance = 1,
      this.efficiency = 0,
      this.lifetime = 0,
      this.recovery = 0});
  factory UserPlayAttributes.fromJson(Map<String, dynamic> json) =>
      UserPlayAttributes(
          luck: checkDouble(json['luck']),
          distance: checkDouble(json['distance']),
          efficiency: checkDouble(json['efficiency']),
          lifetime: checkDouble(json['durability']));
}
