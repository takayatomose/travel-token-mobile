part of 'my_item_bloc.dart';

class MyItemState {
  final List<UserItem> items;
  MyItemState({this.items = const []});

  MyItemState copyWith({List<UserItem>? items}) {
    return MyItemState(items: items ?? this.items);
  }
}
