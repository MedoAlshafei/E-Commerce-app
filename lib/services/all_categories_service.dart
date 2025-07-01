import '../helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories({String? token}) async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products/categories",
      token: token,
    );
    return data;
  }
}
