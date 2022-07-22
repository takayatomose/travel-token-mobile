import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/navigators/game_play_navigator.dart';
import 'package:xtrip_mobile/screens/wallet/wallet_navigator.dart';
import 'package:xtrip_mobile/sessions/game_screen_cubit.dart';
import 'package:xtrip_mobile/sessions/game_screen_state.dart';

class AuthenticatedNavigator extends StatelessWidget {
  const AuthenticatedNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameScreenCubit(),
      child: BlocBuilder<GameScreenCubit, GameScreenState>(
        builder: (context, state) => Navigator(
          pages: [
            if (state is GamePlayScreenState)
              const MaterialPage(child: GamePlayNavigator()),
            if (state is GameWalletScreenSatte)
              const MaterialPage(child: WalletNavigator()),
          ],
          onPopPage: (route, result) => route.didPop(result),
        ),
      ),
    );
  }
}
