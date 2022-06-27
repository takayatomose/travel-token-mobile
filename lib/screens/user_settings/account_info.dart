import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';
import 'package:xtrip_mobile/sessions/session_cubit.dart';
import 'package:xtrip_mobile/sessions/session_state.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final USCubit usCubit = BlocProvider.of<USCubit>(context);
    final SessionState sessionState =
        BlocProvider.of<SessionCubit>(context).state;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            usCubit.userSetting();
          },
        ),
        title: const Text('Your account'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Stack(children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    const Text(
                      'Your name',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        initialValue: sessionState.user.fullName,
                      ),
                    ),
                    // TextFormField(
                    //   initialValue: '',
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          size: 18,
                        ))
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Row(
                  children: [
                    const Text(
                      'Your email',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                    Text(
                      sessionState.user.email,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color.fromRGBO(2, 33, 52, 1)),
                    )
                  ],
                )
              ]),
            ),
          ),
          Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Image(
                  width: 80,
                  height: 80,
                  image: AssetImage(
                      'assets/avatars/${sessionState.user!.profileAvatar}.png'),
                ),
              ))
        ]),
      ),
    );
  }
}
