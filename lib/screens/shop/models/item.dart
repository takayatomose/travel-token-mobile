class Item {
  final String name;
  final int id;
  Item({required this.id, required this.name}) {}

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}