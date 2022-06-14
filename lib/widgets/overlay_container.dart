import 'package:flutter/material.dart';

class OverlayContainer extends StatelessWidget {
  final Widget? child;

  const OverlayContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.7)),
      child: child,
    );
  }
}
