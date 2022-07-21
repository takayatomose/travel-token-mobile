import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';
import 'package:xtrip_mobile/widgets/circle_button.dart';

class MainWalletScreen extends StatelessWidget {
  const MainWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late WalletCubit walletCubit = BlocProvider.of<WalletCubit>(context);

    return BlocConsumer<WalletCubit, WalletState>(
      bloc: walletCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('0 GXT'),
                    if (state.importtedEWallet) ...walletWidget(state, context),
                    if (!state.importtedEWallet)
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext dContext) {
                                  return Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(dContext).pop();
                                                walletCubit.createWallet();
                                              },
                                              child: const Text(
                                                  'Create new wallet')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(dContext).pop();
                                                walletCubit.importWallet();
                                              },
                                              child:
                                                  const Text('Import wallet'))
                                        ]),
                                  );
                                });
                          },
                          child: const Text('Create Wallet'))
                  ]),
            ),
          ),
        );
      },
    );
  }

  List<Widget> walletWidget(WalletState state, BuildContext context) {
    final List<Widget> widgets = [];
    widgets.add(Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1)),
      child: Text(state.eWallet!.hideAddress()),
    ));
    widgets.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleButton(
            primaryColor: Colors.white,
            child: const Icon(
              Icons.download,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          CircleButton(
            primaryColor: Colors.white,
            child: const Icon(
              Icons.upload,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          CircleButton(
            onPressed: () {},
            primaryColor: Colors.white,
            child: const Icon(
              Icons.swap_vert_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ));
    return widgets;
  }
}
