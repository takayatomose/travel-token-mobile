import 'package:flutter/cupertino.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';

class TOSScreen extends StatelessWidget {
  const TOSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const UserSettingWrapper(
      title: 'Disclosure',
      child: Text('Terms and conditions'),
    );
  }
}
