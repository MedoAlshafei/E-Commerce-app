import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/widgets/build_circular_button.dart';
import 'package:shop/widgets/builder_item_description.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.product});

  static const String id = 'productPage';

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: product.id,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: size.height * 0.45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildCircularButton(
                        height: padding.top - 8,
                        width: padding.left + 24,
                        icon: Icons.arrow_back_ios_new,
                        onPressed: () => Navigator.pop(context),
                      ),
                      BuildCircularButton(
                        height: padding.top - 8,
                        width: padding.right + 24,
                        icon: Icons.favorite_border,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        _builderItemCounterSelector(),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _builderItemRating(),
                    const SizedBox(height: 8),
                    BuilderItemDescription(product: product),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builderItemRating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 4),
        Text(
          product.rating.rate.toStringAsFixed(1),
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(width: 8),
        Text(
          '(${product.rating.count} reviews)',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _builderItemCounterSelector() {
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
