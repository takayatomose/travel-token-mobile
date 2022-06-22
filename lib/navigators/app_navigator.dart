import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/cubits/auth_cubit.dart';
import 'package:xtrip_mobile/navigators/auth_navigator.dart';
import 'package:xtrip_mobile/screens/home_screen.dart';
import 'package:xtrip_mobile/screens/loading_screen.dart';
import 'package:xtrip_mobile/screens/unauthorized_permissions_screen.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnAuthorizedPermissions)
            const MaterialPage(child: UnAuthorizedPermissionsScreen()),
          if (state is UnknownSessionState)
            const MaterialPage(child: LoadingScreen()),
          if (state is Unauthenticated)
            MaterialPage(
                child: BlocProvider(
              create: (context) =>
                  AuthCubit(sessionCubit: context.read<SessionCubit>()),
              child: const AuthNavigator(),
            )),
          if (state is Authenticated) MaterialPage(child: const Home()),
        ],
        onPopPage: (router, result) => router.didPop(result),
      );
    });
  }
}
