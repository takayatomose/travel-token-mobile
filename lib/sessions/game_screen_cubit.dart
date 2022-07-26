import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/sessions/game_screen_state.dart';

class GameScreenCubit extends Cubit<GameScreenState> {
  GameScreenCubit() : super(GamePlayScreenState());

  void enterWalletScreen() {
    emit(GameWalletScreenSatte());
  }

  void enterGamePlayScreen() {
    emit(GamePlayScreenState());
  }

  void enterUserItemScreen({required int itemId}) {
    emit(GameItemScreenState(itemId: itemId));
  }
}
