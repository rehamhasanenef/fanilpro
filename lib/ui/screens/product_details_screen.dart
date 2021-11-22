import 'package:flutter/material.dart';
import 'package:fanilproj/data/shared_pref_helper.dart';
import 'package:fanilproj/models/product_response.dart';
import 'package:fanilproj/providers/main_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final routeName = 'productDetailsRoute';
  late double screenHeight;
  final sharedPrefHelper = SharedPrefHelper.sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(builder: (context, mainProvider, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: mainProvider.singleProduct != null
            ? AppBar(actions: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: sharedPrefHelper.isProductInFavourite(
                            mainProvider.singleProduct.id)
                        ? Colors.red
                        : Colors.white,
                  ),
                  onPressed: () {
                    mainProvider.onPressedFavouriteButton(
                        mainProvider.singleProduct.id);
                  },
                ),
              ])
            : null,
        body: mainProvider.singleProduct != null
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.only(bottom: 12),
                            alignment: Alignment.center,
                            height: screenHeight * 0.25,
                            child: Image.network(
                                mainProvider.singleProduct.image),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mainProvider.singleProduct.title,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    mainProvider.singleProduct.description,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    mainProvider.singleProduct.category,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '\$${mainProvider.singleProduct.price}',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ElevatedButton(
                        onPressed: () {
                          mainProvider
                              .addProductToCart(mainProvider.singleProduct!.id);
                        },
                        child: Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ButtonStyle(
                            fixedSize: MaterialStateProperty.resolveWith(
                                (states) => Size(
                                    MediaQuery.of(context).size.width * 0.75,
                                    30)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                      ),
                    ),
                  ],
                ))
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
