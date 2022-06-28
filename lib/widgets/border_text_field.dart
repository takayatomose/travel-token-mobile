import 'package:flutter/material.dart';

class BorderTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final bool? requiredField;
  final String? requiredMessage;
  final double borderRadius;
  final bool hasIcon;

  const BorderTextField(
      {Key? key,
      this.controller,
      required this.padding,
      this.icon,
      this.validator,
      this.hintText,
      this.obscureText = false,
      this.onChanged,
      this.requiredField,
      this.requiredMessage,
      this.borderRadius = 30,
      this.hasIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: hasIcon ? Icon(icon) : null,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)))),
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          if (requiredField == true && requiredMessage != null) {
            if (value == null || value.isEmpty) {
              return requiredMessage;
            }
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}
