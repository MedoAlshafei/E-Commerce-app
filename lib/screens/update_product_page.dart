import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/update_product.dart';
import 'package:shop/widgets/my_button_widget.dart';
import 'package:shop/widgets/my_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            spacing: MediaQuery.of(context).size.height / 100,
            children: [
              MyTextField(
                onChanged: (data) {
                  productName = data;
                },
                hinttext: 'Product Name',
                inputType: TextInputType.text,
              ),
              MyTextField(
                onChanged: (data) {
                  desc = data;
                },
                hinttext: 'description',
                inputType: TextInputType.multiline,
              ),
              MyTextField(
                onChanged: (data) {
                  price = data;
                },
                hinttext: 'price',
                inputType: TextInputType.number,
              ),
              MyTextField(
                onChanged: (data) {
                  image = data;
                },
                hinttext: 'image',
              ),
              MyButton(
                text: 'Update',
                color: Colors.black87,
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await _updateProduct(product);
                    print('Success');
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id.toString(),
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
