import 'package:flutter/material.dart';

class BuilderItemCounterSelector extends StatelessWidget {
  const BuilderItemCounterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
          ),
          icon: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Text(
            '1',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
          ),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
