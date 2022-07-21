import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/initialize_e_wallet/initialize_e_wallet_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/seed_phrase_notice.dart';
import 'package:xtrip_mobile/screens/wallet/widgets/mnemonic_item.dart';

class CheckSeedPhrase extends StatefulWidget {
  const CheckSeedPhrase({Key? key}) : super(key: key);

  @override
  State<CheckSeedPhrase> createState() => _CheckSeedPhraseState();
}

class _CheckSeedPhraseState extends State<CheckSeedPhrase> {
  late InitializeEWalletBloc eWalletBloc;
  late List<String> mnemonicArray;
  late List<int> mnemoicPlace = [];
  @override
  void initState() {
    super.initState();
    eWalletBloc = BlocProvider.of<InitializeEWalletBloc>(context);
    mnemonicArray = List.from(eWalletBloc.state.mnemonicArray);
    mnemonicArray.shuffle();
    for (int i = 0; i < mnemonicArray.length; i++) {
      mnemoicPlace.add(-1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitializeEWalletBloc, InitializeEWalletState>(
      bloc: eWalletBloc,
      listener: (context, state) {},
      builder: (context, state) => SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).newWallet),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  eWalletBloc.add(EnterBackupSeedPhrase());
                },
              ),
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
                  child: Text(
                    state.inputtedSeedPhrase,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    children: List.generate(mnemonicArray.length, (index) {
                      return MnemonicItem(
                        disabled: mnemoicPlace[index] != -1,
                        text: mnemonicArray[index],
                        onTap: () {
                          if (mnemoicPlace[index] == -1) {
                            context.read<InitializeEWalletBloc>().add(
                                MnemoicItemAdded(mItem: mnemonicArray[index]));
                            List<int> tmp = List.from(mnemoicPlace);
                            tmp[index] = state.inputtedMnemonicArray.length;
                            setState(() {
                              mnemoicPlace = tmp;
                            });
                          } else {
                            List<int> tmp = List.from(mnemoicPlace);
                            context
                                .read<InitializeEWalletBloc>()
                                .add(MnemoicItemRemoved(position: tmp[index]));
                            tmp[index] = -1;
                            setState(() {
                              mnemoicPlace = tmp;
                            });
                          }
                        },
                      );
                    }),
                  ),
                ),
                cfSeedPhraseBtn(state, context),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget cfSeedPhraseBtn(InitializeEWalletState state, BuildContext context) {
    final seedPhraseOk = state.inputtedSeedPhrase == state.seedPhrase;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: seedPhraseOk
                ? const Color.fromARGB(255, 128, 8, 1)
                : Colors.grey),
        onPressed: () {
          if (seedPhraseOk) {
            context.read<InitializeEWalletBloc>().add(ExecImportWallet());
          }
        },
        child: Text(
          S.of(context).confirm.toUpperCase(),
          style: TextStyle(
              color: seedPhraseOk
                  ? Colors.white
                  : const Color.fromARGB(255, 241, 241, 241)),
        ));
  }
}
