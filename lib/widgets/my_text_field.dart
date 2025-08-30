import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, this.hintText, this.onChanged, this.inputType});

  final String? hintText;
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
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: onChanged,
        keyboardType: inputType,
        cursorColor: MyColors.darkGrey,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: MyColors.darkGrey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: MyColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: MyColors.darkGrey, width: 1),
          ),
        ),
      ),
    );
  }
}
