import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:xtrip_mobile/widgets/map_bottom_sheet/map_bottom_sheet.dart';

class AbilityButton extends StatelessWidget {
  const AbilityButton(
      {Key? key,
      required this.text,
      required this.detailText,
      required this.backgroundColor,
      required this.progressColor,
      required this.percent,
      this.onPressed})
      : super(key: key);
  final String text;
  final String detailText;
  final Color backgroundColor;
  final Color progressColor;
  final double percent;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return StatisticButton(
      onPressed: onPressed,
      children: [
        Expanded(
          child: CircularPercentIndicator(
            fillColor: Colors.white,
            radius: 20.0,
            percent: 0.8,
            lineWidth: 10,
            backgroundColor: backgroundColor,
            progressColor: progressColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 0.7)),
          ),
        ),
        Text(
          detailText,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.3)),
        )
      ],
    );
  }
}
