import 'package:flutter/material.dart';

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
      child: Material(
        elevation: 5,
        color: color ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: width * 0.8,
          height: height * 0.07,
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
