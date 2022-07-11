import 'package:xtrip_mobile/screens/shop/models/models.dart';

class UserItem extends Item {
  final int userId;
  final int equippedState;
  final int lockState;
  final int level;
  final DateTime lockExpired;
  UserItem({
    required super.id,
    required super.name,
    required super.price,
    required super.efficiency,
    required super.durability,
    required super.luck,
    required super.distance,
    required this.userId,
    required this.equippedState,
    required this.lockState,
    required this.level,
    required this.lockExpired,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      efficiency: json['efficiency'] as int,
      durability: json['durability'] as int,
      luck: json['luck'] as int,
      distance: json['distance'] as int,
      userId: json['user_id'] as int,
      equippedState: json['equippedState'] as int,
      lockState: json['lockState'] as int,
      level: json['level'] as int,
      lockExpired: json['lockExpired'] as DateTime);
}
