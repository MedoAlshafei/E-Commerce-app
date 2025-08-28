import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class SearchBarAndFilterButton extends StatelessWidget {
  const SearchBarAndFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            cursorColor: MyColors.greyDark,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          iconSize: 24,
          style: IconButton.styleFrom(
            backgroundColor: MyColors.greyDark,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(8),
            fixedSize: const Size(55, 55),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          // color: MyColors.greyDark,
          icon: const Icon(Icons.filter_list_rounded),
        ),
      ],
    );
  }
}
