import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController txtController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;

  const TextBox({
    Key? key,
    required this.txtController,
    required this.hintText,
    required this.textInputType,
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
