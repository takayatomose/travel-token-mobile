import 'package:flutter/material.dart';

class UserSettingRow extends StatelessWidget {
  final String label;
  final GestureTapCallback? onTap;
  final String secondLabel;

  const UserSettingRow(
      {Key? key, required this.label, this.onTap, this.secondLabel = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(children: [
          Expanded(
            flex: 90,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            flex: 10,
            child: secondLabel != ''
                ? Text(secondLabel)
                : Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
          )
        ]),
      ),
    );
  }
}
