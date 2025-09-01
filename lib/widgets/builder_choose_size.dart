import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class BuilderChooseSize extends StatefulWidget {
  const BuilderChooseSize({super.key});

  @override
  State<BuilderChooseSize> createState() => _BuilderChooseSizeState();
}

class _BuilderChooseSizeState extends State<BuilderChooseSize> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Size',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: MyColors.textOnWhite,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSizeOption('S'),
            _buildSizeOption('M'),
            _buildSizeOption('L'),
            _buildSizeOption('XL'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeOption(String size) {
    final isSelected = _selectedSize == size;
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedSize = size;
        });
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        backgroundColor: isSelected ? MyColors.textOnWhite : Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isSelected ? MyColors.textOnBlack : MyColors.textOnWhite,
        ),
      ),
    );
  }
}
