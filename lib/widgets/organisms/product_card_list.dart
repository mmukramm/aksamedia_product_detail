import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/models/product.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/widgets/molecules/product_card.dart';

class ProductCardList extends StatelessWidget {
  final String title;
  final List<Product> products;
  final VoidCallback onClickButtonProduct;
  const ProductCardList({
    super.key,
    required this.title,
    required this.products,
    required this.onClickButtonProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: textTheme.titleMedium,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 320,
          child: ListView.separated(
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            separatorBuilder: (_, __) => const SizedBox(
              width: 12,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                onClickButtonProduct: onClickButtonProduct,
              );
            },
          ),
        ),
      ],
    );
  }
}
