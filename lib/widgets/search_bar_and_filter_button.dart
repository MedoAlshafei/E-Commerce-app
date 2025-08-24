import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';

class SearchBarAndFilterButton extends StatelessWidget {
  const SearchBarAndFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: MyColors.greyDark,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.greyDark, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: MyColors.greyDark, width: 1),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          iconSize: 24,
          style: IconButton.styleFrom(
            backgroundColor: MyColors.greyDark,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(8),
            fixedSize: Size(55, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // color: MyColors.greyDark,
          icon: Icon(Icons.filter_list_rounded),
        ),
      ],
    );
  }
}
