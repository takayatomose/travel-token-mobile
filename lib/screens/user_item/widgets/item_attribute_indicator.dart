import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_icon.dart';

class ItemAttributeIndicator extends StatelessWidget {
  final String attributeName;
  final String assetName;
  final int attributeValue;
  final double percent;
  final bool showBaseVal;
  final int baseValue;
  const ItemAttributeIndicator({
    Key? key,
    required this.attributeName,
    required this.assetName,
    required this.attributeValue,
    required this.baseValue,
    this.showBaseVal = false,
    this.percent = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 50,
              child: ItemAttributeIcon(
                assetName: assetName,
                attributeName: attributeName,
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
                  backgroundColor: showBaseVal == true
                      ? const Color.fromRGBO(130, 243, 216, 1)
                      : const Color.fromRGBO(235, 235, 235, 1),
                  progressColor: const Color.fromRGBO(122, 201, 191, 1),
                  percent: (attributeValue / baseValue),
                ),
                Text((showBaseVal == true ? baseValue : attributeValue)
                    .toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
