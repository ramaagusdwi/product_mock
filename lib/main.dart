import 'package:flutter/material.dart';
import 'package:testfokatech/common/navigation.dart';
import 'package:testfokatech/presentation/screens/menu_screen.dart';
import 'package:testfokatech/presentation/screens/product_list_screen.dart';

import 'presentation/screens/product_detail_screen.dart';

void main() {
  // Be sure to add this line if initialize() call happens before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product',
      debugShowCheckedModeBanner: false,
      initialRoute: ProductListScreen.routeName,
      routes: {
        ProductListScreen.routeName: (context) => const ProductListScreen(),
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
