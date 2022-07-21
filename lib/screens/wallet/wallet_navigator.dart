import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';
import 'package:xtrip_mobile/screens/wallet/create_e_wallet.dart';
import 'package:xtrip_mobile/screens/wallet/import_e_wallet.dart';
import 'package:xtrip_mobile/screens/wallet/main_wallet_screen.dart';

class WalletNavigator extends StatelessWidget {
  const WalletNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: BlocBuilder<WalletCubit, WalletState>(
        builder: ((context, state) => Navigator(
              pages: [
                if (state.screenState == WalletScreenState.main)
                  const MaterialPage(child: MainWalletScreen()),
                if (state.screenState == WalletScreenState.importWallet)
                  const MaterialPage(child: ImportEWallet()),
                if (state.screenState == WalletScreenState.createWallet)
                  const MaterialPage(child: CreateEWallet())
              ],
              onPopPage: (route, result) => route.didPop(result),
            )),
      ),
    );
  }
}
