import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/widgets/build_circular_button.dart';
import 'package:shop/widgets/builder_item_counter_selector.dart';
import 'package:shop/widgets/builder_item_description.dart';
import 'package:shop/widgets/builder_item_rating.dart';

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
                          color: Colors.grey[50],
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
                            maxLines: 1,
                            // overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        BuilderItemCounterSelector(),
                      ],
                    ),
                    const SizedBox(height: 8),
                    BuilderItemRating(product: product),
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
}
