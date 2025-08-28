import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.color,
    required this.text,
    required this.onTap,
  });

  final Color? color;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 10,
          minimumSize: Size(width * 0.8, height * 0.07),
          backgroundColor: color ?? MyColors.buttonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: color ?? MyColors.buttonText, fontSize: 18),
        ),
      ),
    );
  }
}
