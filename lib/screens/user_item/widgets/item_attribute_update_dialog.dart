import 'package:flutter/material.dart';
import 'package:xtrip_mobile/screens/user_item/widgets/user_item_btn_actions.dart';

class ItemAttributeUpdateDialog extends StatelessWidget {
  final String title;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onConfirmPressed;
  final List<Widget> widgets;

  const ItemAttributeUpdateDialog(
      {Key? key,
      required this.title,
      this.onCancelPressed,
      this.onConfirmPressed,
      this.widgets = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        width: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/icon_logo1.png')),
            ),
            child: const Image(
                width: 150,
                image: AssetImage('assets/images/sneaker_example.png')),
          ),
          ...widgets,
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: UserItemBtnActions(
              onCancelPressed: () {
                Navigator.of(context).pop();
              },
              onConfirmPressed: () {},
            ),
          )
        ]),
      ),
    );
  }
}
