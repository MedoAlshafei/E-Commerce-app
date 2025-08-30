import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/home_page.dart';
import 'package:shop/screens/product_page.dart';
import 'package:shop/screens/update_product_page.dart';

class AppRouters {
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == '/' || settings.name == HomePage.id) {
      return MaterialPageRoute(builder: (_) => HomePage(), settings: settings);
    }

    if (settings.name == UpdateProductPage.id) {
      return MaterialPageRoute(
        builder: (_) => UpdateProductPage(),
        settings: settings,
      );
    }

    if (settings.name == ProductPage.id) {
      final product = settings.arguments as ProductModel;
      return MaterialPageRoute(
        builder: (_) => ProductPage(product: product),
        settings: settings,
      );
    }

    // Default case for undefined routes
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
      settings: settings,
    );
  }
}
