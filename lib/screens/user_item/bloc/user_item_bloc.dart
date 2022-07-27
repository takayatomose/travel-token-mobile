import 'package:flutter_bloc/flutter_bloc.dart';

part './user_item_event.dart';
part './user_item_state.dart';

class UserItemBloc extends Bloc<UserItemEvent, UserItemState> {
  UserItemBloc() : super(UserItemState()) {
    on<EnterAddPointScreen>((event, emit) =>
        emit(state.copyWith(screenState: UserItemScreenStates.points)));
    on<EnterUserItemMainScreen>(((event, emit) =>
        emit(state.copyWith(screenState: UserItemScreenStates.main))));
    // emit(state);
  }
}
