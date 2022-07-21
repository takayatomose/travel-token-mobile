import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/initialize_e_wallet/initialize_e_wallet_bloc.dart';
import 'package:xtrip_mobile/screens/wallet/bloc/wallet_cubit.dart';
import 'package:xtrip_mobile/screens/wallet/create_wallet_steps/backup_seed_phrase.dart';
import 'package:xtrip_mobile/screens/wallet/create_wallet_steps/check_seed_phrase.dart';

class CreateEWallet extends StatefulWidget {
  const CreateEWallet({Key? key}) : super(key: key);

  @override
  State<CreateEWallet> createState() => _CreateEWalletState();
}

class _CreateEWalletState extends State<CreateEWallet> {
  final GlobalKey<FormState> _formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitializeEWalletBloc(
          formState: InitializeWalletFormState.create,
          walletCubit: context.read<WalletCubit>())
        ..add(GenerateSeedPhrase()),
      child: BlocBuilder<InitializeEWalletBloc, InitializeEWalletState>(
          builder: ((context, state) => Navigator(
                pages: [
                  if (state.createWalletStep ==
                      CreateWalletStep.backupSeedPhrase)
                    const MaterialPage(child: BackupSeedPhrase()),
                  if (state.createWalletStep ==
                      CreateWalletStep.checkSeedPhrase)
                    const MaterialPage(child: CheckSeedPhrase()),
                ],
                onPopPage: (route, result) => route.didPop(result),
              ))),
    );
  }
}
