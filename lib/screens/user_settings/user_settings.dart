import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_state.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
import 'package:xtrip_mobile/widgets/user_balance_column.dart';
import 'package:xtrip_mobile/widgets/user_settings_row.dart';

import '../../models/wallet.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late USCubit usCubit;
  @override
  void initState() {
    super.initState();
    usCubit = BlocProvider.of<USCubit>(context);
    usCubit.fetchUserWallets();
  }

  @override
  Widget build(BuildContext context) {
    final SessionState sessionState =
        BlocProvider.of<SessionCubit>(context).state;
    return BlocConsumer<USCubit, USState>(
      listener: (context, state) {},
      builder: (context, state) {
        state as USSettingState;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 20,
                        child: Image(
                          width: 60,
                          height: 60,
                          image: AssetImage(
                              'assets/avatars/${sessionState.user!.profileAvatar}.png'),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Text(
                          'Welcome,\n${sessionState.user!.fullName}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) =>
                                AlertDialog(
                                  title: const Text('Confirm Sign Out'),
                                  content:
                                      const Text('Are you want to sign out'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                          context
                                              .read<SessionCubit>()
                                              .signOut();
                                        },
                                        child: Text(S.of(context).ok)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                        },
                                        child: Text(S.of(context).cancel))
                                  ],
                                )),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.power_settings_new,
                              color: Color.fromRGBO(255, 128, 8, 1),
                            ),
                            Text(
                              S.of(context).signOut,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 128, 8, 1)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/card.png')),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          decoration: const BoxDecoration(
                              // color: Color.fromRGBO(6, 82, 50, 1),
                              ),
                          child: Row(
                            children: [
                              Expanded(
                                child: UserBalanceColumn(
                                  balanceValue: getWalletBalance(
                                      wallets: state.wallets, token: 'GST'),
                                  label: S.of(context).xTokenBalance('GXT'),
                                  iconAsset: 'assets/images/gold_two.png',
                                ),
                              ),
                              Expanded(
                                child: UserBalanceColumn(
                                  balanceValue: getWalletBalance(
                                      wallets: state.wallets, token: 'XTR'),
                                  label: S.of(context).xTokenBalance('XTR'),
                                  iconAsset: 'assets/images/token_btc.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 50, left: 30),
                          child: Row(
                            children: [
                              Text(
                                sessionState.user!.fullName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (sessionState.locationPermission == false)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Image(
                          image:
                              AssetImage('assets/images/gps_permission.png')),
                    ),
                  if (sessionState.locationPermission == false)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            primary: const Color.fromRGBO(255, 128, 8, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            AppSettings.openLocationSettings();
                          },
                          child: const Text(
                            'Grant GPS access permission',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )),
                    ),
                  ListView(
                    primary: false,
                    shrinkWrap: true,
                    children: [
                      UserSettingRow(
                        label: S.of(context).yourAccount,
                        onTap: () {
                          usCubit.accountInfo();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).changePassword,
                        onTap: () {
                          usCubit.changePassword();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).inviteFriend,
                        onTap: () {
                          usCubit.inviteFriend();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).disclosure,
                        onTap: () {
                          usCubit.tos();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).guidance,
                        onTap: () {
                          usCubit.guide();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).contactUs,
                        onTap: () {
                          usCubit.contactUs();
                        },
                      ),
                      UserSettingRow(
                        label: S.of(context).version,
                        secondLabel: '1.0.0',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getWalletBalance(
      {required List<XtripWallet> wallets, required String token}) {
    if (wallets.isEmpty) {
      return '0';
    }
    final XtripWallet tokenWallet = wallets.firstWhere(
        (element) => element.token == token,
        orElse: () => XtripWallet(token: token, balance: 0));
    return tokenWallet.balance.toString();
  }
}
