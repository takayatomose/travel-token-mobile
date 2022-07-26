abstract class GameScreenState {}

class GamePlayScreenState extends GameScreenState {}

class GameWalletScreenSatte extends GameScreenState {}

class GameItemScreenState extends GameScreenState {
  final int itemId;
  GameItemScreenState({this.itemId = 0});
}
