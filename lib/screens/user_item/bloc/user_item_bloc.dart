import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/repositories/item_repository.dart';
import 'package:xtrip_mobile/utils/api.dart';

part './user_item_event.dart';
part './user_item_state.dart';

class UserItemBloc extends Bloc<UserItemEvent, UserItemState> {
  final int itemId;
  final ItemRepository itemRepository;
  UserItemBloc({required this.itemId, required this.itemRepository})
      : super(UserItemState()) {
    on<EnterAddPointScreen>((event, emit) =>
        emit(state.copyWith(screenState: UserItemScreenStates.points)));
    on<EnterUserItemMainScreen>(((event, emit) =>
        emit(state.copyWith(screenState: UserItemScreenStates.main))));
    // emit(state);
  }
  Future<void> getItem(int itemId) async {}
}
