import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web3dart/web3dart.dart';
import 'package:xtrip_mobile/constants/wallet_constants.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';
import 'package:xtrip_mobile/screens/wallet/services/wallet_address_service.dart';
part './initialize_e_wallet_event.dart';
part './initialize_e_wallet_state.dart';

class InitializeEWalletBloc
    extends Bloc<InitializeEWalletEvent, InitializeEWalletState> {
  final walletService = WalletAddress();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final WalletCubit walletCubit;
  InitializeEWalletBloc(
      {required InitializeWalletFormState formState, required this.walletCubit})
      : super(InitializeEWalletState(walletFormState: formState)) {
    on<SeedPhraseChanged>((event, emit) =>
        emit(state.copyWith(inputtedSeedPhrase: event.seedPhrase)));
    on<ExecImportWallet>((event, emit) async {
      importWalletFromSeed(state.inputtedSeedPhrase);
    });
    on<ExecCreateWallet>((event, emit) async {});

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

  Future<void> importWalletFromSeed(String seedPhrase) async {
    final String privateKey =
        await walletService.getPrivateKey(state.seedPhrase);
    final EthereumAddress publicKey =
        await walletService.getPublicKey(privateKey);
    await secureStorage.write(key: E_WALLET_PRIVATE_KEY, value: privateKey);
    await secureStorage.write(
        key: E_WALLET_PUBLIC_KEY, value: publicKey.toString());
    walletCubit.enterMainWallet();
  }
}
