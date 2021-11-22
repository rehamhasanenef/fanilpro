import 'package:flutter/material.dart';
import 'package:fanilproj/models/product_response.dart';
import 'package:fanilproj/providers/main_provider.dart';
import 'package:fanilproj/ui/widgets/gridview_products.dart';
import 'package:provider/provider.dart';

class FavouriteProducts extends StatefulWidget {
  static final routeName = '/favouritesProductRoute';

  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, List<ProductResponse>>(
      selector: (context, mainProvider) => mainProvider.favouritesProduct,
      builder: (context, products, _) {
        return Scaffold(
            appBar: AppBar(),
            body: products == null || products.isEmpty
                ? Center(
                    child: Text('No Favourite Products'),
                  )
                : Container(child: GridViewProducts(products, 'favourites')));
      },
    );
  }
}
