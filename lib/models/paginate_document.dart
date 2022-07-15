class PaginateDocument {
  final List<dynamic> items;

  PaginateDocument({this.items = const []});

  factory PaginateDocument.fromJson(Map<String, dynamic> json) =>
      PaginateDocument(items: json['items']);
}
