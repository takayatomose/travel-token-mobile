import 'package:flutter/cupertino.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class TOSScreen extends StatelessWidget {
  const TOSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserSettingWrapper(
      title: S.of(context).disclosure,
      child: Text(S.of(context).termConditions),
    );
  }
}
