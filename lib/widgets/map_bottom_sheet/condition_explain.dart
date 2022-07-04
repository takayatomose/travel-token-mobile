import 'package:flutter/material.dart';

class ConditionExplain extends StatelessWidget {
  final String conditionText;
  final String recoverText;
  final String guideText;
  final GestureTapCallback? onTap;

  const ConditionExplain(
      {Key? key,
      required this.conditionText,
      required this.recoverText,
      required this.guideText,
      this.onTap})
      : super(key: key);
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            conditionText,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(0, 0, 0, 0.7)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              recoverText,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              guideText,
              style: const TextStyle(
                  color: Color.fromRGBO(255, 128, 8, 1),
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
