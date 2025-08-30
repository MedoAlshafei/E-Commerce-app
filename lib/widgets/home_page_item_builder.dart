import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/get_all_product_service.dart';
import 'package:shop/widgets/my_item_card_widget.dart';

class HomePageItemBuilder extends StatelessWidget {
  const HomePageItemBuilder({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height * 0.03, // بدل 65
        left: 0, // بدل 16
        right: 0, // بدل 16
        // Removed bottom padding since it's handled at page level
      ),
      child: FutureBuilder<List<ProductModel>>(
        future: AllProductService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<ProductModel> products = snapshot.data!;
            return GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio:
                    width / (height * 0.55), // تقريباً 1.6 حسب النسبة الأصلية
                crossAxisSpacing: width * 0.04, // بدل 8
                mainAxisSpacing: height * 0.03, // بدل 60
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
    );
  }
}
