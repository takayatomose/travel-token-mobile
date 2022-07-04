import 'package:flutter/material.dart';

class ConditionBottomSheet extends StatelessWidget {
  final String title;
  final String? description;
  final String buttonText;
  final VoidCallback? onPressed;
  final List<Widget> rowChildren;
  final VoidCallback? onClosed;

  const ConditionBottomSheet(
      {Key? key,
      required this.title,
      this.description,
      required this.buttonText,
      this.rowChildren = const [],
      this.onPressed,
      this.onClosed})
      : super(key: key);
  @override
  Widget build(Object context) {
    return SizedBox(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 0.7)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  description ?? '',
                  style: const TextStyle(
                      fontSize: 12, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: rowChildren,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        primary: const Color.fromRGBO(255, 128, 8, 1)),
                    onPressed: () {},
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    )),
              ),
            ],
          ),
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: onClosed,
                icon: const Icon(
                  Icons.close,
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                ),
              ))
        ],
      ),
    );
  }
}
