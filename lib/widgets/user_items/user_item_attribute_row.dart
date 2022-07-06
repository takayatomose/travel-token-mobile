import 'package:flutter/material.dart';

class UserItemAttributeRow extends StatelessWidget {
  const UserItemAttributeRow(
      {Key? key,
      required this.assetName,
      required this.attributeName,
      required this.attributeVal,
      this.margin})
      : super(key: key);
  final String assetName;
  final String attributeName;
  final String attributeVal;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 250, 250, 1),
          borderRadius: BorderRadius.circular(6)),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(left: 5, right: 20),
          decoration: const BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1, color: Color.fromRGBO(255, 128, 8, 1)))),
          child: Image(
            image: AssetImage(assetName),
            width: 20,
            height: 20,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              attributeName,
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            attributeVal,
          ),
        )
      ]),
    );
  }
}
