import 'package:flutter/material.dart';

class UserBalanceColumn extends StatelessWidget {
  final String label;
  final String balanceValue;
  final String iconAsset;
  const UserBalanceColumn(
      {Key? key,
      required this.label,
      required this.balanceValue,
      required this.iconAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(209, 209, 209, 1)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image(image: AssetImage(iconAsset)),
            ),
            Text(
              balanceValue,
              style: const TextStyle(
                  color: Color.fromRGBO(255, 128, 8, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    );
  }
}
