part of './user_item_bloc.dart';

enum UserItemScreenStates {
  main,
  points,
  mints,
}

enum ItemFetchStates {
  unknow,
  fetching,
  fetched,
}

class UserItemState {
  final UserItemScreenStates screenState;
  final UserItem? item;
  final ItemFetchStates fetchState;
  UserItemState(
      {this.screenState = UserItemScreenStates.main,
      this.item,
      this.fetchState = ItemFetchStates.unknow});

  UserItemState copyWith(
      {UserItemScreenStates? screenState,
      UserItem? item,
      ItemFetchStates? fetchState}) {
    return UserItemState(
        screenState: screenState ?? this.screenState,
        item: item ?? this.item,
        fetchState: fetchState ?? this.fetchState);
  }
}
