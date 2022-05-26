import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType keyboardType;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.keyboardType,
    this.isPass = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder inputBorder= OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
      ),
      keyboardType: keyboardType,
      obscureText: isPass,
    );
  }
}
