part of './user_item_bloc.dart';

abstract class UserItemEvent {}

class EnterAddPointScreen extends UserItemEvent {}

class EnterUserItemMainScreen extends UserItemEvent {}

class FetchedItem extends UserItemEvent {
  final UserItem item;
  FetchedItem({required this.item});
}
