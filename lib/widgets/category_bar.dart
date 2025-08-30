import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({super.key});
  static const categories = [
    {'icon': Icons.category_rounded, 'name': 'All Items'},
    {'icon': Icons.electrical_services_rounded, 'name': 'Electronics'},
    {'icon': Icons.fastfood, 'name': 'Dress'},
    {'icon': Icons.icecream, 'name': 'T-Shirt'},
    {'icon': Icons.icecream, 'name': 'Jeans'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      // width: double.infinity,
      child: StatefulBuilder(
        builder: (context, setState) {
          int selectedIndex = 0;
          // Use a key to persist selection in StatefulBuilder
          return StatefulBuilder(
            builder: (context, setState) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = index == selectedIndex;
                  final buttonChild = Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        category['icon'] as IconData,
                        color: isSelected ? Colors.white : MyColors.darkGrey,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        category['name'] as String,
                        style: TextStyle(
                          color: isSelected ? Colors.white : MyColors.darkGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                  if (isSelected) {
                    return ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.darkGrey,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        elevation: 0,
                      ),
                      child: buttonChild,
                    );
                  } else {
                    return OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: MyColors.darkGrey,
                        side: const BorderSide(
                          color: MyColors.darkGrey,
                          width: 1.2,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                      ),
                      child: buttonChild,
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
