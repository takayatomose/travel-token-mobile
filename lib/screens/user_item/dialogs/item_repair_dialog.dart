import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';

import '../widgets/user_item_widgets.dart';

class ItemRepairDialog extends StatefulWidget {
  const ItemRepairDialog({Key? key}) : super(key: key);

  @override
  State<ItemRepairDialog> createState() => _ItemRepairDialogState();
}

class _ItemRepairDialogState extends State<ItemRepairDialog> {
  double conditionsVal = 70;
  @override
  Widget build(BuildContext context) {
    return ItemAttributeUpdateDialog(
      onConfirmPressed: () {},
      title: S.of(context).repair,
      widgets: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Text(S
              .of(context)
              .conditionProgress(conditionsVal.toStringAsFixed(2))),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: SliderTheme(
            data: const SliderThemeData(
              trackHeight: 20,
              activeTrackColor: Color.fromRGBO(122, 201, 191, 1),
              thumbColor: Colors.white,
              inactiveTrackColor: Color.fromRGBO(235, 235, 235, 1),
            ),
            child: Slider(
              value: conditionsVal,
              onChanged: (double value) {
                setState(() {
                  if (value > 70) conditionsVal = value;
                });
              },
              divisions: 100,
              min: 0,
              max: 100,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child:
              ItemUpdateCost(costName: S.of(context).cost, costVal: '1.4 XTR'),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            S.of(context).tokenAvailable('10.48 XTR'),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
