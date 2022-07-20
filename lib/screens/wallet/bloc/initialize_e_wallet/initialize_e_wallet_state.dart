part of './initialize_e_wallet_bloc.dart';

enum InitializeWalletFormState { import, create }

enum CreateWalletStep {
  backupSeedPhrase,
  checkSeedPhrase,
}

class InitializeEWalletState {
  final String inputtedSeedPhrase;
  final String emailVerificationCode;
  final InitializeWalletFormState walletFormState;
  final String seedPhrase;
  final List<String> mnemonicArray;
  final CreateWalletStep createWalletStep;
  final List<String> inputtedMnemonicArray;

  InitializeEWalletState(
      {this.walletFormState = InitializeWalletFormState.create,
      this.inputtedSeedPhrase = '',
      this.emailVerificationCode = '',
      this.seedPhrase = '',
      this.mnemonicArray = const [],
      this.createWalletStep = CreateWalletStep.backupSeedPhrase,
      this.inputtedMnemonicArray = const []});
  InitializeEWalletState copyWith(
      {String? inputtedSeedPhrase,
      String? emailVerificationCode,
      InitializeWalletFormState? walletFormState,
      String? seedPhrase,
      List<String>? mnemonicArray,
      CreateWalletStep? createWalletStep,
      List<String>? inputtedMnemonicArray}) {
    return InitializeEWalletState(
        walletFormState: walletFormState ?? this.walletFormState,
        emailVerificationCode:
            emailVerificationCode ?? this.emailVerificationCode,
        inputtedSeedPhrase: inputtedSeedPhrase ?? this.inputtedSeedPhrase,
        seedPhrase: seedPhrase ?? this.seedPhrase,
        mnemonicArray: mnemonicArray ?? this.mnemonicArray,
        createWalletStep: createWalletStep ?? this.createWalletStep,
        inputtedMnemonicArray:
            inputtedMnemonicArray ?? this.inputtedMnemonicArray);
  }
}