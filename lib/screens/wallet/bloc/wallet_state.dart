part of './wallet_cubit.dart';

enum WalletScreenState { main, eWallet, createWallet, importWallet }

class WalletState {
  final WalletScreenState screenState;
  final XtripWallet? eWallet;
  final dynamic spendingWallet;
  final bool importtedEWallet;

  WalletState(
      {this.screenState = WalletScreenState.main,
      this.eWallet,
      this.spendingWallet,
      this.importtedEWallet = false});
  WalletState copyWith(
      {WalletScreenState? screenState,
      XtripWallet? eWallet,
      dynamic spendingWallet,
      bool? importtedEWallet}) {
    return WalletState(
        screenState: screenState ?? this.screenState,
        eWallet: eWallet ?? this.eWallet,
        spendingWallet: spendingWallet ?? this.spendingWallet,
        importtedEWallet: importtedEWallet ?? this.importtedEWallet);
  }
}
