import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('iki detail'),
      ),
    );
  }
}
