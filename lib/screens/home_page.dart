import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/get_all_product_service.dart';
import 'package:shop/widgets/my_item_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded, color: Colors.black),
          ),
        ],
        title: const Text('New Trend', style: TextStyle(color: Colors.black)),
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
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 100,
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
