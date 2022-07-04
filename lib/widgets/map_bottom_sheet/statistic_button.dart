import 'package:flutter/material.dart';

class StatisticButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<Widget> children;

  const StatisticButton({
    Key? key,
    this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 120,
        height: 140,
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
