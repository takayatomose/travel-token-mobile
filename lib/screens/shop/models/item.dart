class Item {
  final String name;
  final String icon;
  final int id;
  final int price;
  final int efficiency;
  final int durability;
  final int luck;
  final int distance;
  Item(
      {required this.id,
      required this.name,
      required this.icon,
      required this.price,
      required this.efficiency,
      required this.durability,
      required this.luck,
      required this.distance}) {}

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int,
        name: json['name'] as String,
        icon: json['icon'] as String,
        price: json['price'] as int,
        efficiency: json['efficiency'] as int,
        durability: json['durability'] as int,
        luck: json['luck'] as int,
        distance: json['distance'] as int,
      );
}
