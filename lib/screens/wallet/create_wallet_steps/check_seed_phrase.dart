import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/initialize_e_wallet/initialize_e_wallet_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/seed_phrase_notice.dart';

class CheckSeedPhrase extends StatelessWidget {
  const CheckSeedPhrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<InitializeEWalletBloc>(context),
      child: BlocBuilder<InitializeEWalletBloc, InitializeEWalletState>(
        builder: (context, state) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).newWallet),
              centerTitle: true,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                SeedPhraseNotice(
                  text: S.of(context).chooseSeedPhraseMessage,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(state.inputtedSeedPhrase),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
