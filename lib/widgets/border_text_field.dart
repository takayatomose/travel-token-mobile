import 'package:flutter/material.dart';

class BorderTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const BorderTextField(
      {Key? key,
      this.controller,
      required this.padding,
      this.icon,
      this.validator,
      this.hintText,
      this.obscureText = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}
