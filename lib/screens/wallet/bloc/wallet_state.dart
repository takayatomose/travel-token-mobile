part of './wallet_cubit.dart';

enum WalletScreenState { main, eWallet, createWallet, importWallet }

class WalletState {
  final WalletScreenState screenState;
  final dynamic eWallet;
  final dynamic spendingWallet;

  WalletState(
      {this.screenState = WalletScreenState.main,
      this.eWallet,
      this.spendingWallet});
  WalletState copyWith(
      {WalletScreenState? screenState,
      dynamic eWallet,
      dynamic spendingWallet}) {
    return WalletState(
      screenState: screenState ?? this.screenState,
      eWallet: eWallet ?? this.eWallet,
      spendingWallet: spendingWallet ?? this.spendingWallet,
    );
  }
}
