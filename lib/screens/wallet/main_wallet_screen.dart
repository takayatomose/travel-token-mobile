import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';

class MainWalletScreen extends StatelessWidget {
  const MainWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dContext) {
                      return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(dContext).pop();
                                    walletCubit.createWallet();
                                  },
                                  child: const Text('Create new wallet')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(dContext).pop();
                                    walletCubit.importWallet();
                                  },
                                  child: const Text('Import wallet'))
                            ]),
                      );
                    });
              },
              child: const Text('Create Wallet'))
        ]),
      ),
    );
  }
}
