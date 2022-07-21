import 'package:flutter/material.dart';

class MnemonicItem extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool disabled;

  const MnemonicItem(
      {Key? key, required this.text, this.onTap, this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 2, color: Colors.grey)),
          child: Text(
            text,
            style: TextStyle(
                color: disabled ? Colors.grey : Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
