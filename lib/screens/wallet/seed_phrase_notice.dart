import 'package:flutter/material.dart';

class SeedPhraseNotice extends StatelessWidget {
  final String text;

  const SeedPhraseNotice({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 12, fontStyle: FontStyle.italic, color: Colors.redAccent),
      ),
    );
  }
}
