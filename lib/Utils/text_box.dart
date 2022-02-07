import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController txtController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final String? label;
  final IconData? icon;
  final Iterable<String>? hintList;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const MyTextBox({
    Key? key,
    required this.txtController,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.label,
    this.enabled = true,
    this.isPassword = false,
    this.icon,
    this.hintList,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: textInputType,
      enabled: enabled,
      autofillHints: hintList,
      focusNode: focusNode,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
          hintText: hintText,
          label: label == null ? null : Text(label!),
          icon: icon == null ? null : Icon(icon),
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8.0)),
    );
  }
}
