import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  static const String id = 'productPage';

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Image.network(product.image),
        ),
      ),
    );
  }
}
