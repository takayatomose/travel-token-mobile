import 'package:flutter/material.dart';

class ToastContainer extends StatefulWidget {
  const ToastContainer(
      {Key? key,
      this.type = 'success',
      required this.title,
      required this.message})
      : super(key: key);
  final String type;
  final String title;
  final String message;

  @override
  State<ToastContainer> createState() => _ToastContainerState();
}

class _ToastContainerState extends State<ToastContainer> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.type == 'success'
        ? const Color.fromRGBO(1, 132, 65, 1)
        : const Color.fromRGBO(255, 128, 8, 1);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      ),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8))),
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(15),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 20),
            child: Icon(
              Icons.check_circle,
              color: primaryColor,
            ),
          ),
          Expanded(
            flex: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                Text(
                  widget.message,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
          )
        ]),
      ),
    );
  }
}
