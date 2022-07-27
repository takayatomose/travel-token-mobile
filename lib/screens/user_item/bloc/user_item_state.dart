part of './user_item_bloc.dart';

enum UserItemScreenStates {
  main,
  points,
  mints,
}

class UserItemState {
  final UserItemScreenStates screenState;
  UserItemState({this.screenState = UserItemScreenStates.main});

  UserItemState copyWith({UserItemScreenStates? screenState}) {
    return UserItemState(screenState: screenState ?? this.screenState);
  }
}
