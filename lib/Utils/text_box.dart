import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final TextEditingController? txtController;
  final String? hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final bool enabled;
  final String? label;
  final IconData? icon;
  final Iterable<String>? hintList;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;

  const MyTextBox({
    Key? key,
    this.txtController,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.label,
    this.enabled = true,
    this.isPassword = false,
    this.icon,
    this.hintList,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
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
