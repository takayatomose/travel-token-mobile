import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  final Widget? child;

  const CardShadow({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.grey, offset: Offset(0.1, 0.1), blurRadius: 2.0),
      ], borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: child,
    );
  }
}
