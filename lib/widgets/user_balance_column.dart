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
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image(
                  image: AssetImage(iconAsset),
                  width: 20,
                  height: 20,
                ),
              ),
              Text(
                balanceValue,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
