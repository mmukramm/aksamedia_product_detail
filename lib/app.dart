import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/theme.dart';
import 'package:aksamedia_product_detail/screens/product_detail.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      home: const ProductDetail(),
    );
  }
}
