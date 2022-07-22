import 'package:xtrip_mobile/screens/shop/models/models.dart';

class UserItemStates {
  static const int equipped = 1;
  static const int unEquipped = 0;
  static const int mainEquipped = 2;
}

class UserItem extends Item {
  final int userId;
  final int equippedState;
  final int lockState;
  final int level;
  final DateTime lockExpired;
  final int numOfMints;
  final String code;
  UserItem({
    required super.id,
    required super.name,
    required super.icon,
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
    required this.numOfMints,
    required this.code,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      icon: json['icon'].toString(),
      price: json['price'] ?? 0,
      efficiency: json['efficiency'],
      durability: json['durability'],
      luck: json['luck'],
      distance: json['distance'],
      userId: json['user_id'],
      equippedState: json['equipped_state'],
      lockState: json['lock_state'],
      level: json['level'],
      numOfMints: json['num_of_mints'],
      code: json['code'].toString(),
      lockExpired: json['lock_expired'] != null
          ? json['lock_expired'] as DateTime
          : DateTime.now());
}
