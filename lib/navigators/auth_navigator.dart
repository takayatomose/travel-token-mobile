import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/screens/onboard_screen.dart';
import 'package:xtrip_mobile/screens/signin_screen.dart';
import 'package:xtrip_mobile/screens/signup_screen.dart';
import 'package:xtrip_mobile/screens/user_active_screen.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state.screenState == ScreenState.onBoard)
            const MaterialPage(child: OnBoardScreen()),
          if (state.screenState == ScreenState.login)
            const MaterialPage(child: SignInScreen()),
          if (state.screenState == ScreenState.signUp)
            const MaterialPage(child: SignUpScreen()),
          if (state.screenState == ScreenState.activation)
            const MaterialPage(child: UserActiveScreen())
        ],
        onPopPage: (router, result) => router.didPop(result),
      );
    });
  }
}
