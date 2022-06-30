import 'package:flutter/material.dart';

class AbilityButton extends StatelessWidget {
  // final String imageName;
  final VoidCallback? onTap;
  // final String text;

  final List<Widget> children;

  const AbilityButton({
    Key? key,
    this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        width: 110,
        height: 110,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
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
