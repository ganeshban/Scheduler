import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController txtController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;

  const MyTextBox({
    Key? key,
    required this.txtController,
    required this.hintText,
    required this.textInputType,
    this.enabled = true,
    this.isPassword = false,
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
      decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8.0)),
    );
  }
}
