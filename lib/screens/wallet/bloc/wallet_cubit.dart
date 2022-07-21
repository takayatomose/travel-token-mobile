import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:xtrip_mobile/constants/wallet_constants.dart';
import 'package:xtrip_mobile/models/wallet.dart';
import 'package:xtrip_mobile/screens/wallet/services/wallet_address_service.dart';
part './wallet_state.dart';
// import 'package:xtrip_mobile/screens/wallet/bloc/wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletAddress walletAddress = WalletAddress();
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

  void enterMainWallet() async {
    await getEWallet();
    emit(state.copyWith(screenState: WalletScreenState.main));
  }

  Future<void> getEWallet() async {
    final String? publicKey =
        await secureStorage.read(key: E_WALLET_PUBLIC_KEY);
    final String? privateKey =
        await secureStorage.read(key: E_WALLET_PRIVATE_KEY);
    if (privateKey != null &&
        publicKey != null &&
        privateKey != '' &&
        publicKey != '') {
      var apiUrl = 'https://api.avax-test.network/ext/C/rpc';
      var httpClient = Client();
      var web3Client = Web3Client(apiUrl, httpClient);
      EtherAmount balance = await web3Client
          .getBalance(await walletAddress.getPublicKey(privateKey));
      print(balance.toString());
      emit(state.copyWith(
          eWallet: XtripWallet(address: publicKey), importtedEWallet: true));
    }
  }
}
