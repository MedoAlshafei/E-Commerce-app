import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class BuildCircularButton extends StatelessWidget {
  const BuildCircularButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(icon, size: 24, color: MyColors.darkGrey),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
