import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/user_balance_column.dart';
import 'package:xtrip_mobile/widgets/user_settings_row.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    width: 60,
                    height: 60,
                    image: AssetImage('assets/avatars/avatar_1.png'),
                  ),
                  const Text(
                    '',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  TextButton(
                    onPressed: () {},
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
                          const Expanded(
                            flex: 50,
                            child: Text(
                              'Takaya Tomose',
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  UserSettingRow(
                    label: 'Your account',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Change password',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Invite your friend',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Disclosure',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Guidance',
                    onTap: () {},
                  ),
                  UserSettingRow(
                    label: 'Contact us',
                    onTap: () {},
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
