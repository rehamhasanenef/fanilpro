import 'package:fanilproj/models/rating_model.dart';

class ProductResponse {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;
  ProductResponse({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.category,
    @required this.image,
    @required this.rating,
  });

  factory ProductResponse.fromJson(Map<dynamic, dynamic> json) {
    return ProductResponse(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'price': this.price,
      'description': this.description,
      'category': this.category,
      'image': this.image,
      'rating': this.rating.toJson(),
    };
  }
}
