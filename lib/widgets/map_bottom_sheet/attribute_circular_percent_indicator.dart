import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AttributeCircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double percent;
  final double lineWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Color centerColor;

  const AttributeCircularPercentIndicator(
      {Key? key,
      this.radius = 20,
      required this.percent,
      this.lineWidth = 10,
      this.backgroundColor = const Color.fromRGBO(238, 238, 238, 1),
      required this.progressColor,
      this.centerColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircularPercentIndicator(
        fillColor: Colors.white,
        radius: radius,
        percent: percent,
        lineWidth: lineWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
        center: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: centerColor,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      spreadRadius: 2)
                ])),
      ),
    );
  }
}
