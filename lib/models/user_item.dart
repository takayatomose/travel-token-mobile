import 'package:xtrip_mobile/screens/shop/models/models.dart';

class UserItemStates {
  static const int equipped = 1;
  static const int unEquipped = 0;
  static const int mainEquipped = 2;
}

class ItemCondition {
  final int condition;
  final double lifetimeCount;
  const ItemCondition({
    this.condition = 0,
    this.lifetimeCount = 0,
  });
  factory ItemCondition.fromJson(Map<String, dynamic> json) => ItemCondition(
      condition: json['condition'] ?? 0,
      lifetimeCount: json['life_time_count'] ?? 0);
}

class UserItem extends Item {
  final int userId;
  final int equippedState;
  final int lockState;
  final int level;
  final DateTime lockExpired;
  final int numOfMints;
  final String code;
  final int recovery;
  final int lifetime;
  final int maxDistance;
  final int maxLuck;
  final int maxRecovery;
  final int maxEfficiency;
  final ItemCondition itemCondition;
  final int availablePoint;
  final String image;
  UserItem({
    this.recovery = 0,
    this.lifetime = 0,
    this.maxDistance = 0,
    this.maxLuck = 0,
    this.maxRecovery = 0,
    this.maxEfficiency = 0,
    required super.id,
    required super.name,
    required super.icon,
    required super.price,
    required super.efficiency,
    super.durability = 0,
    required super.luck,
    required super.distance,
    required this.userId,
    required this.equippedState,
    required this.lockState,
    required this.level,
    required this.lockExpired,
    required this.numOfMints,
    required this.code,
    this.itemCondition = const ItemCondition(),
    this.availablePoint = 0,
    this.image = '',
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        icon: json['icon'].toString(),
        price: json['price'] ?? 0,
        efficiency: json['efficiency'],
        luck: json['luck'],
        distance: json['distance'],
        recovery: json['recovery'] ?? 0,
        userId: json['user_id'],
        equippedState: json['equipped_state'],
        lockState: json['lock_state'],
        level: json['level'],
        maxDistance: json['max_distance'] ?? 0,
        maxLuck: json['max_luck'] ?? 0,
        maxEfficiency: json['max_efficiency'] ?? 0,
        maxRecovery: json['max_recovery'] ?? 0,
        numOfMints: json['num_of_mints'],
        lifetime: json['life_time'] ?? 0,
        code: json['code'].toString(),
        itemCondition: json['item_condition'] != null
            ? ItemCondition.fromJson(json['item_condition'])
            : const ItemCondition(),
        lockExpired: json['lock_expired'] = DateTime.now(),
        availablePoint: json['available_point'] ?? 0,
        image: json['image'] ?? '',
      );
}
