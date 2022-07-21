import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double borderWidth;
  final Color borderColor;
  final Color? primaryColor;
  final EdgeInsetsGeometry? padding;

  const CircleButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.borderWidth = 1,
      this.borderColor = const Color(0xFF000000),
      this.primaryColor,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: padding,
          primary: primaryColor,
          shape: CircleBorder(
              side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ))),
      child: child,
    );
  }
}
