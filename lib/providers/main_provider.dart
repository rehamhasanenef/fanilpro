import 'package:flutter/material.dart';
import 'package:fanilproj/data/api_helper.dart';
import 'package:fanilproj/data/shared_pref_helper.dart';
import 'package:fanilproj/models/product_response.dart';

class MainProvider extends ChangeNotifier {
  List<ProductResponse> allProducts;
  ProductResponse singleProduct;
  List<dynamic> allCategories;
  List<ProductResponse> categoryProducts;
  List<ProductResponse> favouritesProduct;
  List<ProductResponse> cartProduct;
  final apiHelper = ApiHelper.apiHelper;
  final sharedPrefHelper = SharedPrefHelper.sharedPrefHelper;
  String currentCategory = '';
  int productQuantity = 0;
  getAllProducts() async {
    List products = await apiHelper.getAllProducts();
    allProducts = products.map((map) => ProductResponse.fromJson(map)).toList();
    favouritesProduct = allProducts
        .where((product) => sharedPrefHelper.isProductInFavourite(product.id))
        .toList();
    getAllCartProducts();
    notifyListeners();
  }

  getSingleProduct(int id) async {
    singleProduct = null;
    Map product = await apiHelper.getSingleProduct(id);
    singleProduct = ProductResponse.fromJson(product);
    notifyListeners();
  }

  determineCurrentCategory(String category) {
    currentCategory = category;
  }

  getAllCategories() async {
    allCategories = await apiHelper.getAllCategories();
    getCategoryProducts(allCategories[0]);
    notifyListeners();
  }

  getCategoryProducts(String categoryName) async {
    List products = await apiHelper.getCategoryProducts(categoryName);
    categoryProducts = products.map((product) {
      return ProductResponse.fromJson(product);
    }).toList();
    determineCurrentCategory(categoryName);
    notifyListeners();
  }

  getAllFavouriteProducts() {
    favouritesProduct = allProducts
        .where((product) => sharedPrefHelper.isProductInFavourite(product.id))
        .toList();
    notifyListeners();
  }

  getAllCartProducts() {
    cartProduct = allProducts
        .where((product) => sharedPrefHelper.isProductInCart(product.id))
        .toList();
  }

  addProductToFavourite(int id) {
    sharedPrefHelper.addProductToFavourite(id);
    getAllFavouriteProducts();
  }

  addProductToCart(int id) {
    sharedPrefHelper.addProductToCart(id);
    getAllCartProducts();
  }

  deleteProductFromFavourite(int id) {
    sharedPrefHelper.deleteProductFromFavourite(id);
    getAllFavouriteProducts();
  }

  onPressedFavouriteButton(int id) {
    sharedPrefHelper.isProductInFavourite(id)
        ? deleteProductFromFavourite(id)
        : addProductToFavourite(id);
  }

  deleteProductFromCart(int id) {
    sharedPrefHelper.deleteProductFromCart(id);
    getAllCartProducts();
    notifyListeners();
  }

  getProductQuantity(int id) {
    return sharedPrefHelper.getProductQuantity(id);
  }
}
