import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemAttributeIndicator extends StatelessWidget {
  final String attributeName;
  final String assetName;
  final String attributeValue;
  final double percent;

  const ItemAttributeIndicator(
      {Key? key,
      required this.attributeName,
      required this.assetName,
      required this.attributeValue,
      this.percent = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 50,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image(width: 25, height: 25, image: AssetImage(assetName)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      attributeName,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercentIndicator(
                  lineHeight: 8,
                  width: 150,
                  barRadius: const Radius.circular(18),
                  backgroundColor: const Color.fromRGBO(130, 243, 216, 1),
                  progressColor: const Color.fromRGBO(122, 201, 191, 1),
                  percent: percent,
                ),
                Text(attributeValue),
              ],
            ),
          )
        ],
      ),
    );
  }
}
