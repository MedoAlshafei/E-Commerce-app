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
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final TextPainter textPainter = TextPainter(
              text: TextSpan(
                text: widget.product.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              maxLines: widget.trimLines,
              textDirection: TextDirection.ltr,
            )..layout(maxWidth: constraints.maxWidth);

            final bool didExceedMaxLines = textPainter.didExceedMaxLines;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.description,
                  maxLines: _isExpanded ? null : widget.trimLines,
                  overflow:
                      didExceedMaxLines && !_isExpanded
                          ? TextOverflow.ellipsis
                          : TextOverflow.visible,
                ),
                if (didExceedMaxLines)
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
            );
          },
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
