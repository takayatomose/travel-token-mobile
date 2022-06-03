import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final Color color;
  final double margin;

  const CircleWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.margin,
      this.child});

  // const CircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      decoration:
          BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: const [
        BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.1), blurRadius: 1.0)
      ]),
      child: child,
    );
  }
}
