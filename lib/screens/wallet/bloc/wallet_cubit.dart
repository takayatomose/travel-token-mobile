import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:xtrip_mobile/constants/wallet_constants.dart';
import 'package:xtrip_mobile/models/wallet.dart';
part './wallet_state.dart';
// import 'package:xtrip_mobile/screens/wallet/bloc/wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  WalletCubit() : super(WalletState(screenState: WalletScreenState.main)) {
    getEWallet();
  }
  void importWallet() {
    emit(state.copyWith(screenState: WalletScreenState.importWallet));
  }

  void createWallet() {
    emit(state.copyWith(screenState: WalletScreenState.createWallet));
  }

  void mainEWallet() async {
    await getEWallet();
    emit(state.copyWith(screenState: WalletScreenState.main));
  }

  Future<void> getEWallet() async {
    final String? publicKey =
        await secureStorage.read(key: E_WALLET_PUBLIC_KEY);
    final String? privateKey =
        await secureStorage.read(key: E_WALLET_PRIVATE_KEY);
    if (privateKey != '' && publicKey != '') {
      emit(state.copyWith(
          eWallet: Wallet(address: publicKey), importtedEWallet: true));
    }
  }
}
