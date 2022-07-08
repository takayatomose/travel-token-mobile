import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ConditionCircularPercentIndicator extends StatelessWidget {
  const ConditionCircularPercentIndicator(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.progressColor,
      required this.percent})
      : super(key: key);
  final String text;
  final Color backgroundColor;
  final Color progressColor;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      lineWidth: 15,
      percent: percent,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
      center: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  color: Color.fromRGBO(0, 0, 0, 0.25))
            ]),
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
