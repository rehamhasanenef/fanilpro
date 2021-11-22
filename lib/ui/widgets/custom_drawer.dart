import 'package:flutter/material.dart';
import 'package:fanilproj/ui/screens/cart_screen.dart';
import 'package:fanilproj/ui/screens/favourites_products.dart';

class CustomDrawer extends StatelessWidget {
  List<Map> screens = [
    {
      'title': 'Favourites',
      'screenRoute': FavouriteProducts.routeName,
    },
    {
      'title': 'Cart',
      'screenRoute': CartProducts.routeName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: screens
              .map((screen) => ListTile(
                    title: Text(
                      screen['title'],
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(screen['screenRoute']);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
