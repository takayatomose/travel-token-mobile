import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/screens/signin_screen.dart';
import 'package:xtrip_mobile/screens/signup_screen.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state == AuthState.login)
            const MaterialPage(child: SignInScreen()),
          if (state == AuthState.signUp)
            const MaterialPage(child: SignUpScreen()),
        ],
        onPopPage: (router, result) => router.didPop(result),
      );
    });
  }
}
