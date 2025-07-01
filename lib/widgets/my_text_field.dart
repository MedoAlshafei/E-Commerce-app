import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, this.hinttext, this.onChanged, this.inputType});

  final String? hinttext;
  final Function(String)? onChanged;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: TextField(
        onChanged: onChanged,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(),
          ),
        ),
      ),
    );
  }
}
