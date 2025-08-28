import 'package:flutter/material.dart';
import 'package:shop/theme/my_colors.dart';
import 'package:shop/widgets/category_bar.dart';
import 'package:shop/widgets/customer_bar.dart';
import 'package:shop/widgets/home_page_item_builder.dart';
import 'package:shop/widgets/nav_bar.dart';
import 'package:shop/widgets/search_bar_and_filter_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'homePage';

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final statusBarHeight = padding.top;
    final bottomBarHeight = padding.bottom;

    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content
            Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight * 0.16,
                right: 16,
                left: 16,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: CustomerBar()),
                  SliverToBoxAdapter(child: SizedBox(height: height * 0.02)),
                  SliverToBoxAdapter(child: SearchBarAndFilterButton()),
                  SliverToBoxAdapter(child: SizedBox(height: height * 0.02)),
                  SliverToBoxAdapter(child: CategoryBar()),
                  SliverToBoxAdapter(
                    child: HomePageItemBuilder(height: height, width: width),
                  ),
                  // Add bottom padding so content doesn't get hidden behind floating navbar
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: height * 0.10,
                    ), // Adjust this value based on your navbar height
                  ),
                ],
              ),
            ),
            // Floating navigation bar at the bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: NavBar(bottomBarHeight: bottomBarHeight, width: width),
            ),
          ],
        ),
      ),
    );
  }
}
