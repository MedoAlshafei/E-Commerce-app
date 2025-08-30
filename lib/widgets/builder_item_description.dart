import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/theme/my_colors.dart';

class BuilderItemDescription extends StatefulWidget {
  const BuilderItemDescription({
    super.key,
    required this.product,
    this.trimLines = 3,
  });

  final ProductModel product;
  final int trimLines;

  @override
  State<BuilderItemDescription> createState() => _BuilderItemDescriptionState();
}

class _BuilderItemDescriptionState extends State<BuilderItemDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.description,
              maxLines: _isExpanded ? null : widget.trimLines,
              overflow:
                  _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            if (widget.product.description.length > 100)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? 'Read Less' : 'Read More',
                  style: TextStyle(
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
