import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtrip_mobile/bloc/user_setting/us_cubit.dart';

class UserSettingWrapper extends StatelessWidget {
  final Widget? child;
  final String title;

  const UserSettingWrapper({Key? key, this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final USCubit usCubit = BlocProvider.of<USCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            usCubit.userSetting();
          },
        ),
      ),
      body: child,
    );
  }
}
