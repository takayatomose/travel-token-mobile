part of './initialize_e_wallet_bloc.dart';

abstract class InitializeEWalletEvent {}

class SeedPhraseChanged extends InitializeEWalletEvent {
  final String seedPhrase;
  SeedPhraseChanged({required this.seedPhrase});
}

class EmailVerificationCodeChanged extends InitializeEWalletEvent {
  final String code;
  EmailVerificationCodeChanged({required this.code});
}

class ExecImportWallet extends InitializeEWalletEvent {}

class ExecCreateWallet extends InitializeEWalletEvent {}

class GenerateSeedPhrase extends InitializeEWalletEvent {}

class CheckSeedPhraseEvent extends InitializeEWalletEvent {}

class MnemoicItemAdded extends InitializeEWalletEvent {
  final String mItem;
  MnemoicItemAdded({required this.mItem});
}

class MnemoicItemRemoved extends InitializeEWalletEvent {
  final int position;
  MnemoicItemRemoved({required this.position});
}
