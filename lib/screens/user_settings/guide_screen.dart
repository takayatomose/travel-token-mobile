import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserSettingWrapper(
      title: 'Guidance',
      child: Text('guidance'),
    );
  }
}
