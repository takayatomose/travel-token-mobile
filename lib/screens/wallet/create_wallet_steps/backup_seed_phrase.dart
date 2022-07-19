import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/initialize_e_wallet/initialize_e_wallet_bloc.dart';

import '../seed_phrase_notice.dart';

class BackupSeedPhrase extends StatelessWidget {
  const BackupSeedPhrase({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SeedPhraseNotice(
                              text: S.of(context).seedPhraseNotice1),
                          SeedPhraseNotice(
                              text: S.of(context).seedPhraseNotice2),
                          if (state.seedPhrase.isNotEmpty)
                            Expanded(
                              child: ListView.builder(
                                  itemCount: state.mnemonicArray.length,
                                  itemBuilder: (BuildContext listContext,
                                          int i) =>
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                            "${i + 1}   ${state.mnemonicArray[i]}"),
                                      )),
                            ),
                        ],
                      )),
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<InitializeEWalletBloc>()
                          .add(CheckSeedPhraseEvent());
                    },
                    child: Text(S.of(context).backedupSeedPhrase.toLowerCase()))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
