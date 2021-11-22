import 'package:flutter/material.dart';
import 'package:fanilproj/models/product_response.dart';
import 'package:fanilproj/providers/main_provider.dart';
import 'package:fanilproj/ui/widgets/gridview_products.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  static final routeName = '/cartProductRoute';

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, List<ProductResponse>>(
      selector: (context, mainProvider) => mainProvider.cartProduct,
      builder: (context, products, _) {
        return Scaffold(
            appBar: AppBar(),
            body: products == null || products.isEmpty
                ? Center(
                    child: Text('No Products In Your Cart'),
                  )
                : Container(
                    child: GridViewProducts(products, 'Cart'),
                  ));
      },
    );
  }
}
