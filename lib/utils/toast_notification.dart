import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xtrip_mobile/widgets/toast_container.dart';

class ToastNotification {
  static final FToast fToast = FToast();
  static void showToast(BuildContext context,
      {required String type, String title = '', String message = ''}) {
    fToast.init(context);
    fToast.showToast(
      child: ToastContainer(
        title: title,
        message: message,
        type: type,
      ),
    );
  }
}
