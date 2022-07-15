import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserSettingWrapper(
      title: S.of(context).guidance,
      child: Text(S.of(context).guidance),
    );
  }
}
