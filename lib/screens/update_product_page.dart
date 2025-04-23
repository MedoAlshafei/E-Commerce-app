import 'package:flutter/material.dart';
import 'package:shop/widgets/my_button_widget.dart';
import 'package:shop/widgets/my_text_field.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        spacing: MediaQuery.of(context).size.height / 85,
        children: [
          MyTextFormField(hinttext: 'Product Name'),
          MyTextFormField(hinttext: 'description'),
          MyTextFormField(hinttext: 'price'),
          MyTextFormField(hinttext: 'image'),
          MyButton(text: 'Update', color: Colors.black87, onPressed: () {}),
        ],
      ),
    );
  }
}
