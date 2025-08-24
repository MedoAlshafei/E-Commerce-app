import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/update_product_page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              color: themeOf.cardColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.title.toString().substring(0, 15)}...',
                      overflow: TextOverflow.values.first,
                      maxLines: 1,
                      style: themeOf.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          '${product.price.toString()}',
                          style: themeOf.textTheme.titleLarge,
                        ),
                        Icon(
                          Icons.favorite,
                          color: themeOf.colorScheme.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 26,
              top: -45,
              child: Image.network(product.image, height: 70, width: 70),
            ),
          ],
        ),
      ),
    );
  }
}
