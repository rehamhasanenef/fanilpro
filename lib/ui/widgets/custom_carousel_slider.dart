import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fanilproj/models/product_response.dart';

class CustomCarousalSlider extends StatelessWidget {
  final List<ProductResponse> products;
  final double screenHeight;
  CustomCarousalSlider(this.products, this.screenHeight);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      // height: screenHeight * 0.25,
      child: CarouselSlider(
          items: products.map((e) => Image.network(e.image)).toList(),
          options: CarouselOptions(
            height: screenHeight * 0.25,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
