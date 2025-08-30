import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/product_page.dart';
import 'package:shop/theme/my_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.id, arguments: product);
      },
      child: Container(
        width: width * 0.45,
        constraints: BoxConstraints(maxHeight: height * 0.35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: _builderItemImageAndFavoriteButton(height, width),
            ),
            const SizedBox(height: 4),
            Flexible(child: _builderProductTitle()),
            const SizedBox(height: 2),
            _builderProductPrice(),
          ],
        ),
      ),
    );
  }

  Widget _builderProductTitle() {
    return Text(
      '${product.title.split(' ').take(3).join(' ')}',
      style: const TextStyle(
        fontSize: 14,
        color: MyColors.textOnWhite,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _builderProductPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price}',
          style: TextStyle(
            fontSize: 14,
            color: MyColors.textOnWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              product.rating.rate.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 12,
                color: MyColors.textOnWhite,
                fontWeight: FontWeight.w400,
              ),
            ),
            // const SizedBox(width: 4),
            // Text(
            //   '(${product.rating.count})',
            //   style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _builderItemImageAndFavoriteButton(double height, double width) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.network(product.image, fit: BoxFit.contain),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: MyColors.darkGrey,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
