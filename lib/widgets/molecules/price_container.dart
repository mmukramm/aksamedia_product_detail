import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/core/utils/format_to_idr.dart';
import 'package:aksamedia_product_detail/widgets/atoms/price_section.dart';

class PriceContainer extends StatelessWidget {
  final double customerPrice;
  final double commissionPercent;
  const PriceContainer({
    super.key,
    required this.customerPrice,
    required this.commissionPercent,
  });

  @override
  Widget build(BuildContext context) {
    final discount = (customerPrice * commissionPercent);
    final resellerPrice = customerPrice - discount;
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PriceSection(
                    money: customerPrice,
                    description: 'Harga Customer',
                  ),
                  const VerticalDivider(),
                  PriceSection(
                    money: resellerPrice,
                    description: 'Harga Reseller',
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: secondaryColor500,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: textTheme.bodyMedium,
                children: [
                  const TextSpan(text: 'Komisi '),
                  TextSpan(
                    text: FormatToIdr.convertToIdr(discount, 0),
                    style: textTheme.displayMedium,
                  ),
                  TextSpan(text: ' (${commissionPercent * 100.0})%'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
