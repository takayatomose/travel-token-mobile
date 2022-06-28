import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_state.dart';
import 'package:xtrip_mobile/screens/user_settings/account_info.dart';
import 'package:xtrip_mobile/screens/user_settings/change_password.dart';
import 'package:xtrip_mobile/screens/user_settings/contactus_screen.dart';
import 'package:xtrip_mobile/screens/user_settings/guide_screen.dart';
import 'package:xtrip_mobile/screens/user_settings/tos.dart';
import 'package:xtrip_mobile/screens/user_settings/user_settings.dart';

class UserNavigator extends StatelessWidget {
  const UserNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => USCubit(),
      child: BlocBuilder<USCubit, USState>(
        builder: ((context, state) => Navigator(
              pages: [
                if (state is USSettingState)
                  const MaterialPage(child: UserSettingsScreen()),
                if (state is USInfoState)
                  const MaterialPage(child: AccountInfoScreen()),
                if (state is USPasswordState)
                  const MaterialPage(child: ChangePassword()),
                if (state is USTosState) const MaterialPage(child: TOSScreen()),
                if (state is USContactState)
                  const MaterialPage(child: ContactUsScreen()),
                if (state is USGuideState)
                  const MaterialPage(child: GuideScreen()),
              ],
              onPopPage: (router, result) => router.didPop(result),
            )),
      ),
    );
  }
}
