import 'package:dio/dio.dart';

class ApiHelper {
  ApiHelper._();
  Dio dio = Dio();
  static final apiHelper = ApiHelper._();
  Future<List> getAllProducts() async {
    String url = 'https://fakestoreapi.com/products';
    Response response = await dio.get(url);
    List products = response.data;
    return products;
  }

  Future<Map> getSingleProduct(int id) async {
    String url = 'https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    Map product = response.data;
    return product;
  }

  Future<List<dynamic>> getAllCategories() async {
    String url = 'https://fakestoreapi.com/products/categories';
    Response response = await dio.get(url);
    List<dynamic> categories = response.data;
    return categories;
  }

  Future<List> getCategoryProducts(String categoryName) async {
    String url = 'https://fakestoreapi.com/products/category/$categoryName';
    Response response = await dio.get(url);
    List products = response.data;
    return products;
  }
}
