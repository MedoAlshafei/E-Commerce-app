import 'package:flutter/material.dart';

class BuilderItemCounterSelector extends StatelessWidget {
  const BuilderItemCounterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _builderIconButton(icon: const Icon(Icons.remove), onPressed: () {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text(
            '1',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        _builderIconButton(icon: const Icon(Icons.add), onPressed: () {}),
      ],
    );
  }

  Widget _builderIconButton({
    required Icon icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: CircleBorder(
          side: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),
      icon: icon,
    );
  }
}
