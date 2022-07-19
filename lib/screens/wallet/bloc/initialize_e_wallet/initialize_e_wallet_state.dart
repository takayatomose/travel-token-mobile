part of './initialize_e_wallet_bloc.dart';

enum InitializeWalletFormState { import, create }

class InitializeEWalletState {
  final String inputtedSeedPhrase;
  final String emailVerificationCode;
  final InitializeWalletFormState walletFormState;
  final String seedPhrase;
  final List<String> mnemonicArray;

  InitializeEWalletState(
      {this.walletFormState = InitializeWalletFormState.create,
      this.inputtedSeedPhrase = '',
      this.emailVerificationCode = '',
      this.seedPhrase = '',
      this.mnemonicArray = const []});
  InitializeEWalletState copyWith(
      {String? inputtedSeedPhrase,
      String? emailVerificationCode,
      InitializeWalletFormState? walletFormState,
      String? seedPhrase,
      List<String>? mnemonicArray}) {
    return InitializeEWalletState(
        walletFormState: walletFormState ?? this.walletFormState,
        emailVerificationCode:
            emailVerificationCode ?? this.emailVerificationCode,
        inputtedSeedPhrase: inputtedSeedPhrase ?? this.inputtedSeedPhrase,
        seedPhrase: seedPhrase ?? this.seedPhrase,
        mnemonicArray: mnemonicArray ?? this.mnemonicArray);
  }
}
