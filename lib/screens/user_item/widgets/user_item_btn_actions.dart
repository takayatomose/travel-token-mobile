import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';

class UserItemBtnActions extends StatelessWidget {
  const UserItemBtnActions(
      {Key? key, this.onCancelPressed, this.onConfirmPressed})
      : super(key: key);
  final VoidCallback? onCancelPressed;
  final VoidCallback? onConfirmPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  side: const BorderSide(
                      width: 1, color: Color.fromRGBO(255, 128, 8, 1))),
              onPressed: onCancelPressed,
              child: Text(
                S.of(context).cancel,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 128, 8, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              primary: const Color.fromRGBO(255, 128, 8, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: onConfirmPressed,
          child: Text(
            S.of(context).confirm,
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
