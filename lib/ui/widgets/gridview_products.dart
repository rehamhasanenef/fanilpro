import 'package:flutter/material.dart';
import 'package:fanilproj/models/product_response.dart';
import 'package:fanilproj/providers/main_provider.dart';
import 'package:provider/provider.dart';

class GridViewProducts extends StatelessWidget {
  final List<ProductResponse> products;
  final String cardType;

  GridViewProducts(this.products, this.cardType);

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of<MainProvider>(context, listen: false);
    return GridView(
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 4 / 5),
      children: [
        ...products.map((product) => Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                        padding: EdgeInsets.all(4),
                      ),
                    ),
                    Text(
                      product.title,
                      style: TextStyle(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product.category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      '\$${product.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Visibility(
                        visible: cardType == 'Cart',
                        child: Text(
                            'quantity: ${provider.getProductQuantity(product.id)}'))
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    onPressed: () {
                      cardType == 'favourites'
                          ? provider.deleteProductFromFavourite(product.id)
                          : provider.deleteProductFromCart(product.id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
