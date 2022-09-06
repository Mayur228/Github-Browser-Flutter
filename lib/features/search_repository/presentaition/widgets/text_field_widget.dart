import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  // final ValueChanged onTextValueChange;
  final TextEditingController textEditingController;

  const TextFieldWidget(
      {Key? key, required this.hintText, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}