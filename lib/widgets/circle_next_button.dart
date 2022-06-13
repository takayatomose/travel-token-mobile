import 'package:flutter/material.dart';

class CircleNextButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CircleNextButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(255, 128, 8, 1),
            shape: const CircleBorder(
                side: BorderSide(width: 8, color: Colors.white)),
            padding: const EdgeInsets.all(25)),
        onPressed: onPressed,
        child: const Icon(
          Icons.east,
          size: 30,
        ));
  }
}
