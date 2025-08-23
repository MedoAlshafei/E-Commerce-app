import 'package:flutter/material.dart';

class NavBarModel {
  final IconData outlineIcon;
  final IconData filledIcon;
  final Color color;
  final Color selectedIconColor;
  final bool isSelected;

  NavBarModel({
    required this.outlineIcon,
    required this.filledIcon,
    required this.color,
    required this.selectedIconColor,
    this.isSelected = false,
  });

  IconData get icon => isSelected ? filledIcon : outlineIcon;

  NavBarModel copyWith({
    IconData? outlineIcon,
    IconData? filledIcon,
    Color? color,
    Color? selectedIconColor,
    bool? isSelected,
  }) {
    return NavBarModel(
      outlineIcon: outlineIcon ?? this.outlineIcon,
      filledIcon: filledIcon ?? this.filledIcon,
      color: color ?? this.color,
      selectedIconColor: selectedIconColor ?? this.selectedIconColor,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
