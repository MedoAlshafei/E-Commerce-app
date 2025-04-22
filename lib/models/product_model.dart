class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final RatingModel rating;

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  RatingModel({required this.rate, required this.count});

  final num rate;
  final num count;

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] as num),
      count: (jsonData['count'] as num),
    );
  }
}
