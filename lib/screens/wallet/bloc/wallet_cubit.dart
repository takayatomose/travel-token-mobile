import 'package:flutter_bloc/flutter_bloc.dart';
part './wallet_state.dart';
// import 'package:xtrip_mobile/screens/wallet/bloc/wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState(screenState: WalletScreenState.main)) {}
  void importWallet() {
    emit(state.copyWith(screenState: WalletScreenState.importWallet));
  }

  void createWallet() {
    emit(state.copyWith(screenState: WalletScreenState.createWallet));
  }
}
