import 'package:flutter/material.dart';
import '../theme/my_colors.dart';
import '../models/nav_bar_model.dart';

class NavBar extends StatefulWidget {
  final double width;

  final double bottomBarHeight;

  const NavBar({super.key, required this.width, required this.bottomBarHeight});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  late List<NavBarModel> _navItems;

  @override
  void initState() {
    super.initState();
    _navItems = [
      NavBarModel(
        outlineIcon: Icons.home_outlined,
        filledIcon: Icons.home,
        color: Colors.grey,
        selectedIconColor: Colors.white,
        isSelected: true,
      ),
      NavBarModel(
        outlineIcon: Icons.shopping_bag_outlined,
        filledIcon: Icons.shopping_bag,
        color: Colors.grey,
        selectedIconColor: Colors.white,
        isSelected: false,
      ),
      NavBarModel(
        outlineIcon: Icons.favorite_outline,
        filledIcon: Icons.favorite,
        color: Colors.grey,
        selectedIconColor: Colors.white,
        isSelected: false,
      ),
      NavBarModel(
        outlineIcon: Icons.person_outline,
        filledIcon: Icons.person,
        color: Colors.grey,
        selectedIconColor: Colors.white,
        isSelected: false,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      // Update selection state for all items
      for (int i = 0; i < _navItems.length; i++) {
        _navItems[i] = _navItems[i].copyWith(isSelected: i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          // top: widget.bottomBarHeight + 4,
          left: widget.width * 0.02,
          right: widget.width * 0.02,
          bottom: widget.bottomBarHeight + 16,
        ),
        child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: widget.width * 0.04),
          decoration: BoxDecoration(
            color: MyColors.greyDark,
            borderRadius: BorderRadius.all(Radius.circular(44)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withAlpha(150),
                offset: Offset(0, -30),
                blurRadius: 20,
              ),
              BoxShadow(
                color: Colors.white.withAlpha(170),
                offset: Offset(0, -20),
                blurRadius: 25,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _navItems.length,
              (index) => InkWell(
                onTap: () => _onItemTapped(index),
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color:
                        _navItems[index].isSelected
                            ? Colors.white.withOpacity(0.15)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Icon(
                      _navItems[index].icon,
                      size: 24,
                      color:
                          _navItems[index].isSelected
                              ? _navItems[index].selectedIconColor
                              : _navItems[index].color,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
