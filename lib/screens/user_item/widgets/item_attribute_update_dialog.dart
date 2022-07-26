import 'package:flutter/material.dart';
import 'package:xtrip_mobile/generated/l10n.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          side: const BorderSide(
                              width: 1, color: Color.fromRGBO(255, 128, 8, 1))),
                      onPressed: () {},
                      child: Text(
                        S.of(context).cancel,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 128, 8, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 35),
                      primary: const Color.fromRGBO(255, 128, 8, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  child: Text(
                    S.of(context).confirm,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
