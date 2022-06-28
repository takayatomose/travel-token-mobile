import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';
import 'package:xtrip_mobile/widgets/user_balance_column.dart';
import 'package:xtrip_mobile/widgets/user_settings_row.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SessionState _sessionState =
        BlocProvider.of<SessionCubit>(context).state;
    final USCubit usCubit = BlocProvider.of<USCubit>(context);
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
                          'assets/avatars/${_sessionState.user!.profileAvatar}.png'),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Text(
                      'Welcome,\n${_sessionState.user!.fullName}',
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
                        builder: (BuildContext _context) => AlertDialog(
                              title: const Text('Confirm Sign Out'),
                              content: const Text('Are you want to sign out'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(_context).pop();
                                      context.read<SessionCubit>().signOut();
                                    },
                                    child: const Text('Ok')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(_context).pop();
                                    },
                                    child: const Text('Cancel'))
                              ],
                            )),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.power_settings_new,
                          color: Color.fromRGBO(255, 128, 8, 1),
                        ),
                        Text(
                          'Sign out',
                          style:
                              TextStyle(color: Color.fromRGBO(255, 128, 8, 1)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(2, 35, 52, 1),
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 35),
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(6, 82, 50, 1)),
                      child: Row(
                        children: const [
                          Expanded(
                            child: UserBalanceColumn(
                              balanceValue: '790,900',
                              label: 'Game Coin balance',
                              iconAsset: 'assets/images/gold_two.png',
                            ),
                          ),
                          Expanded(
                            child: UserBalanceColumn(
                              balanceValue: '790,900',
                              label: 'Token balance',
                              iconAsset: 'assets/images/token_btc.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 50),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 50,
                            child: Text(
                              _sessionState.user!.fullName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 50,
                            child: Container(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (_sessionState.locationPermission == false)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Image(
                      image: AssetImage('assets/images/gps_permission.png')),
                ),
              if (_sessionState.locationPermission == false)
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
                    label: 'Your account',
                    onTap: () {
                      usCubit.accountInfo();
                    },
                  ),
                  UserSettingRow(
                    label: 'Change password',
                    onTap: () {
                      usCubit.changePassword();
                    },
                  ),
                  UserSettingRow(
                    label: 'Invite your friend',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Disclosure',
                    onTap: () {
                      usCubit.tos();
                    },
                  ),
                  UserSettingRow(
                    label: 'Guidance',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Contact us',
                    onTap: () {
                      usCubit.contactUs();
                    },
                  ),
                  UserSettingRow(
                    label: 'Version',
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
  }
}
