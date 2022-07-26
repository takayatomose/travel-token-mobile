import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemAttributeIndicatorBorder extends StatelessWidget {
  const ItemAttributeIndicatorBorder(
      {Key? key, required this.centerText, required this.percent})
      : super(key: key);
  final String centerText;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: LinearPercentIndicator(
        padding: const EdgeInsets.all(0),
        lineHeight: 20,
        percent: percent,
        backgroundColor: Colors.transparent,
        barRadius: const Radius.circular(18),
        progressColor: const Color.fromRGBO(122, 201, 191, 1),
        center: Text(
          centerText,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
