import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';

class ItemMintsProgress extends StatelessWidget {
  final int maxNumOfMints;
  final int numOfMints;
  // final String textCenter;

  const ItemMintsProgress(
      {Key? key, this.maxNumOfMints = 5, this.numOfMints = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  progressWidgets(max: maxNumOfMints, current: numOfMints)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).shoeMintsProgress("$numOfMints/$maxNumOfMints"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> progressWidgets({required max, required current}) {
    List<Widget> widgets = [];
    for (var i = 0; i < max; i++) {
      widgets.add(Expanded(
        flex: 1,
        child: Container(
          margin: i < max - 1 ? const EdgeInsets.only(right: 3) : null,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: i == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18))
                : (i == max - 1
                    ? const BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18))
                    : null),
            color: i < current
                ? const Color.fromRGBO(122, 201, 191, 1)
                : const Color.fromRGBO(227, 227, 227, 1),
          ),
          // color:,
          // decoration: BoxDecoration(),
        ),
      ));
    }
    return widgets;
  }
}
