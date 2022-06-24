import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/container_background.dart';
import 'package:xtrip_mobile/widgets/overlay_container.dart';

class UnAuthorizedPermissionsScreen extends StatelessWidget {
  const UnAuthorizedPermissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContainerBackground(
      bgAsset: 'assets/images/onboard_1.png',
      child: OverlayContainer(
          child: AlertDialog(
        title: Text('Permissions Error'),
        content: Text('You need accept location background to run app!'),
      )),
    );
  }
}
