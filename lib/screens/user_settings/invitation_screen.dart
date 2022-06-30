import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_state.dart';
import 'package:xtrip_mobile/utils/toast_notification.dart';
import 'package:xtrip_mobile/widgets/toast_container.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class UserInvitationScreen extends StatefulWidget {
  const UserInvitationScreen({Key? key}) : super(key: key);

  @override
  State<UserInvitationScreen> createState() => _UserInvitationScreenState();
}

class _UserInvitationScreenState extends State<UserInvitationScreen> {
  late USCubit usCubit;
  @override
  void initState() {
    super.initState();
    usCubit = BlocProvider.of<USCubit>(context);
    usCubit.fetchInvitationCode();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<USCubit, USState>(
      listener: (context, state) {},
      builder: (context, state) {
        state as USInviteState;
        return UserSettingWrapper(
          title: 'Invite your friend',
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text(
                      'Your invitation code',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color.fromRGBO(2, 33, 52, 1),
                            width: 3)),
                    child: Text(state.invitationCode),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Guidance',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Container(
                  height: height * 0.4,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const SingleChildScrollView(
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sodales ut etiam sit amet nisl. Rhoncus mattis rhoncus urna neque viverra justo. Sit amet porttitor eget dolor morbi non arcu. Elementum nisi quis eleifend quam adipiscing. Tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Nulla malesuada pellentesque elit eget gravida cum sociis. Rhoncus aenean vel elit scelerisque mauris. Eget arcu dictum varius duis at consectetur. Magna sit amet purus gravida quis blandit turpis cursus in. Placerat in egestas erat imperdiet sed euismod nisi porta lorem. Risus quis varius quam quisque id diam vel. Lectus Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sodales ut etiam sit amet nisl. Rhoncus mattis rhoncus urna neque viverra justo. Sit amet porttitor eget dolor morbi non arcu. Elementum nisi quis eleifend quam adipiscing. Tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Nulla malesuada pellentesque elit eget gravida cum sociis. Rhoncus aenean vel elit scelerisque mauris. Eget arcu dictum varius duis at consectetur. Magna sit amet purus gravida quis blandit turpis cursus in. Placerat in egestas erat imperdiet sed euismod nisi porta lorem. Risus quis varius quam quisque id diam vel. Lectus Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,'),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 128, 8, 1),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 45)),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: state.invitationCode));
                      ToastNotification.showToast(context,
                          type: 'success',
                          title: 'Invitation code copied!',
                          message: 'You have copied invitation code!');
                    },
                    child: const Text(
                      'Invite',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
