import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';
import 'package:xtrip_mobile/screens/wallet/widgets/wallet_address_text.dart';
import 'package:xtrip_mobile/utils/toast_notification.dart';
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
                    // if (!state.importtedEWallet)
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
    widgets.add(WalletAddressText(
      address: state.eWallet!.hiddenAddress(),
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
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(S.of(context).receive.toUpperCase()),
                          ),
                          QrImage(
                            data: state.eWallet!.address!,
                            size: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(S.of(context).scanAddress),
                          ),
                          WalletAddressText(address: state.eWallet!.address!),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Clipboard.setData(ClipboardData(
                                    text: state.eWallet!.address));
                                ToastNotification.showToast(context,
                                    type: 'success',
                                    title: S.of(context).successfullyCopied,
                                    message: S.of(context).addressCopied);
                              },
                              child: Text(
                                S.of(context).copyAddress.toUpperCase(),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
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
