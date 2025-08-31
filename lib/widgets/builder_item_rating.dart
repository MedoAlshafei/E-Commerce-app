import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class BuilderItemRating extends StatelessWidget {
  const BuilderItemRating({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
}
