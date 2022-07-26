import 'package:flutter/material.dart';

class ItemUpdateCost extends StatelessWidget {
  const ItemUpdateCost(
      {Key? key, required this.costName, required this.costVal})
      : super(key: key);
  final String costName;
  final String costVal;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(235, 235, 235, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            costName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text(
            costVal,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
