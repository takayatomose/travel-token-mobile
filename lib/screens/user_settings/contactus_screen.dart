import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';
import 'package:xtrip_mobile/utils/toast_notification.dart';
import 'package:xtrip_mobile/widgets/form_label.dart';
import 'package:xtrip_mobile/widgets/user_setting_wrapper.dart';
import 'package:flutter/services.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserSettingWrapper(
      title: S.of(context).contactUs,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FormLabel(text: S.of(context).sendUsEmail),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: const Color.fromRGBO(217, 217, 217, 1), width: 1)),
            margin: const EdgeInsets.only(top: 13),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'contact@xtrip.travel',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(33, 38, 48, 1)),
                    ),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(const ClipboardData(
                              text: 'contact@xtrip.travel'));
                          ToastNotification.showToast(context,
                              type: 'success',
                              title: S.of(context).emailCopied,
                              message: S.of(context).emailCopiedMsg);
                        },
                        icon: const Icon(
                          Icons.copy_rounded,
                          color: Color.fromRGBO(255, 128, 8, 1),
                        ))
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
