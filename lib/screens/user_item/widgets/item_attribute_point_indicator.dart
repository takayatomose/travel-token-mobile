import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/item_attribute_icon.dart';

class ItemAttributePointIndicator extends StatelessWidget {
  const ItemAttributePointIndicator(
      {Key? key,
      required this.assetName,
      required this.attributeName,
      required this.attributeVal,
      this.onSubPressed,
      this.onAddPressed})
      : super(key: key);
  final String assetName;
  final String attributeName;
  final String attributeVal;
  final VoidCallback? onSubPressed;
  final VoidCallback? onAddPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 50,
          child: ItemAttributeIcon(
            assetName: assetName,
            attributeName: attributeName,
          ),
        ),
        Expanded(
          flex: 50,
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(
              width: 25,
              height: 25,
              child: ElevatedButton(
                onPressed: onSubPressed,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(2),
                    primary: const Color.fromRGBO(238, 238, 238, 1)),
                child: const Icon(
                  Icons.remove,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                attributeVal,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: ElevatedButton(
                onPressed: onAddPressed,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(2),
                    primary: const Color.fromRGBO(238, 238, 238, 1)),
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
