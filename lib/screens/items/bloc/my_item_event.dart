part of 'my_item_bloc.dart';

@immutable
abstract class MyItemEvent {}

class EquippedItem extends MyItemEvent {
  final int itemId;
  EquippedItem({required this.itemId});
}

class UnEquippedItem extends MyItemEvent {
  final int itemId;
  UnEquippedItem({required this.itemId});
}

class SetMainEquippedItem extends MyItemEvent {
  final int itemId;
  SetMainEquippedItem({required this.itemId});
}

class FetchItems extends MyItemEvent {}

class FetchItemEquippedAttributes extends MyItemEvent {}
