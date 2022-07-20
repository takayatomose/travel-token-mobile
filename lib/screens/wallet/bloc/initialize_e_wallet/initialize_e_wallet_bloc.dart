import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/services/wallet_address_service.dart';
part './initialize_e_wallet_event.dart';
part './initialize_e_wallet_state.dart';

class InitializeEWalletBloc
    extends Bloc<InitializeEWalletEvent, InitializeEWalletState> {
  final walletService = WalletAddress();
  InitializeEWalletBloc({required InitializeWalletFormState formState})
      : super(InitializeEWalletState(walletFormState: formState)) {
    on<SeedPhraseChanged>((event, emit) =>
        emit(state.copyWith(inputtedSeedPhrase: event.seedPhrase)));
    on<ExecImportWallet>((event, emit) async {
      // TODO: email verification
    });
    on<ExecCreateWallet>((event, emit) {});

    on<GenerateSeedPhrase>((event, emit) {
      final String mnemonic = walletService.generateMnemonic();
      emit(state.copyWith(
          seedPhrase: mnemonic, mnemonicArray: mnemonic.split(' ')));
    });

    on<CheckSeedPhraseEvent>(
      (event, emit) => emit(
          state.copyWith(createWalletStep: CreateWalletStep.checkSeedPhrase)),
    );

    on<MnemoicItemAdded>(
      (event, emit) {
        List<String> inputtedMnemonicArray =
            List.from(state.inputtedMnemonicArray);
        inputtedMnemonicArray.add(event.mItem);
        emit(state.copyWith(
            inputtedMnemonicArray: inputtedMnemonicArray,
            inputtedSeedPhrase: List.from(
                    inputtedMnemonicArray.where((element) => element != ""))
                .join(" ")));
      },
    );
    on<MnemoicItemRemoved>((event, emit) {
      List<String> inputtedMnemonicArray =
          List.from(state.inputtedMnemonicArray);
      inputtedMnemonicArray[event.position] = "";
      emit(state.copyWith(
          inputtedMnemonicArray: inputtedMnemonicArray,
          inputtedSeedPhrase:
              List.from(inputtedMnemonicArray.where((element) => element != ""))
                  .join(" ")));
    });
  }
}
