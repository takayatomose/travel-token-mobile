import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/initialize_e_wallet/initialize_e_wallet_bloc.dart';

class ImportEWallet extends StatefulWidget {
  const ImportEWallet({Key? key}) : super(key: key);

  @override
  State<ImportEWallet> createState() => _ImportEWalletState();
}

class _ImportEWalletState extends State<ImportEWallet> {
  final GlobalKey<FormState> _importWalletFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InitializeEWalletBloc(formState: InitializeWalletFormState.import),
      child: BlocConsumer<InitializeEWalletBloc, InitializeEWalletState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).importWallet),
            centerTitle: true,
            actions: [],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: _importWalletFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).seedPhrase,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      minLines: 10,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).seedPhraseEmpty;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context
                            .read<InitializeEWalletBloc>()
                            .add(SeedPhraseChanged(seedPhrase: value));
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_importWalletFormKey.currentState!.validate()) {
                            context
                                .read<InitializeEWalletBloc>()
                                .add(ExecImportWallet());
                          }
                        },
                        child: Text(S.of(context).importWallet))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
