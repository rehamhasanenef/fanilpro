import 'package:flutter/material.dart';
import 'package:fanilproj/models/product_response.dart';
import 'package:fanilproj/providers/main_provider.dart';
import 'package:fanilproj/ui/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class CategoryProductsCard extends StatelessWidget {
  final List<ProductResponse> products;

  CategoryProductsCard(this.products);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 4 / 5),
        children: [
          ...products.map((product) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailsScreen.routeName,
                  );
                  Provider.of<MainProvider>(context, listen: false)
                      .getSingleProduct(product.id);
                },
                child: Column(
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
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
