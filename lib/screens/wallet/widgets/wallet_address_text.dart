import 'package:flutter/material.dart';

class WalletAddressText extends StatelessWidget {
  final String address;

  const WalletAddressText({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1)),
      child: Text(address),
    );
  }
}
