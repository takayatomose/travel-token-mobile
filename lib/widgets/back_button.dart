import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonCustom({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      // right: 0,
      left: 20,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: const Color.fromRGBO(33, 38, 48, 0.5),
        child: IconButton(
          icon: const Icon(Icons.west),
          color: const Color.fromRGBO(255, 255, 255, 0.7),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
