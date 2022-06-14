import 'package:flutter/material.dart';

class ContainerBackground extends StatelessWidget {
  final Widget? child;
  final String bgAsset;
  const ContainerBackground({Key? key, this.child, required this.bgAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(bgAsset), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
      ),
    );
  }
}
