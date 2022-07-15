part of 'my_item_bloc.dart';

class MyItemState {
  final List<UserItem> items;
  final int numOfItems;
  final ListSubmissionStatus listSubmissionStatus;
  MyItemState(
      {this.items = const [],
      this.numOfItems = 0,
      this.listSubmissionStatus = const InitialListStatus()});

  MyItemState copyWith(
      {List<UserItem>? items,
      int? numOfItems,
      ListSubmissionStatus? listSubmissionStatus}) {
    return MyItemState(
        items: items ?? this.items,
        numOfItems: numOfItems ?? this.numOfItems,
        listSubmissionStatus:
            listSubmissionStatus ?? this.listSubmissionStatus);
  }
}
