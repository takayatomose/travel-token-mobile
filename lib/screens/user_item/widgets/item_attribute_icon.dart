import 'package:flutter/material.dart';

class ItemAttributeIcon extends StatelessWidget {
  const ItemAttributeIcon(
      {Key? key, required this.assetName, required this.attributeName})
      : super(key: key);
  final String assetName;
  final String attributeName;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Image(width: 25, height: 25, image: AssetImage(assetName)),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            attributeName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
