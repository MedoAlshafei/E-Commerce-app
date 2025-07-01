import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/get_all_product_service.dart';
import 'package:shop/widgets/my_item_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });
  static const String id = 'homePage';

  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(
              themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
        title: Text('New Trend', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 65,
          left: 16,
          right: 16,
          bottom: 24,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 60,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemCard(product: products[index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
