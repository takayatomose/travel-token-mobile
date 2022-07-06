import 'package:flutter/material.dart';

class StatisticButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<Widget> children;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  const StatisticButton({
    Key? key,
    this.onPressed,
    required this.children,
    this.width = 120,
    this.height = 140,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
