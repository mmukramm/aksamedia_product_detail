import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/models/product.dart';
import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/helpers/asset_path.dart';
import 'package:aksamedia_product_detail/core/helpers/svg_helper.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/core/utils/format_to_idr.dart';
import 'package:aksamedia_product_detail/widgets/atoms/custom_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onClickButtonProduct;
  const ProductCard({
    super.key,
    required this.product,
    required this.onClickButtonProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                AssetPath.getImage(product.imageName),
                height: 180,
                fit: BoxFit.cover,
              ),
              if (product.isNew)
                Positioned(
                  top: 0,
                  right: 12,
                  child: Stack(
                    children: [
                      SvgHelper(
                        assetPath: AssetPath.getIcon('bookmark.svg'),
                        width: 40,
                        color: secondaryColor500,
                      ),
                      Positioned(
                        top: 6,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            'New',
                            textAlign: TextAlign.center,
                            style: textTheme.bodySmall,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: infoColor500.withOpacity(.8),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style:
                          textTheme.bodySmall!.copyWith(color: scaffoldColor),
                      children: [
                        TextSpan(
                          text: '${product.commission * 100}% ',
                        ),
                        const TextSpan(
                          text: 'Komisi',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            product.name,
            style: textTheme.titleSmall,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Harga Reseller',
                    style:
                        textTheme.bodySmall!.copyWith(color: primaryColor500),
                  ),
                  Text(
                    FormatToIdr.convertToIdr(product.price, 0),
                    style:
                        textTheme.titleSmall!.copyWith(color: successColor600),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgHelper(
                    width: 16,
                    assetPath: AssetPath.getIcon('archive.svg'),
                    color: primaryColor500,
                  ),
                  Text(
                    '${product.amount > 99 ? '99+' : product.amount} pcs',
                    style:
                        textTheme.bodySmall!.copyWith(color: primaryColor500),
                  )
                ],
              )
            ],
          ),
          CustomButton(
            onClick: onClickButtonProduct,
            child: const Text('Bagikan Produk'),
          ),
        ],
      ),
    );
  }
}
