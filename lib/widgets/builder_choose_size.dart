import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class BuilderChooseSize extends StatelessWidget {
  const BuilderChooseSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Choose Size',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.textOnWhite,
          ),
        ),
      ],
    );
  }
}
