import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/core/utils/format_to_idr.dart';

class PriceSection extends StatelessWidget {
  final double money;
  final String description;
  const PriceSection({
    super.key,
    required this.money,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FormatToIdr.convertToIdr(money, 0),
          style: textTheme.displaySmall,
        ),
        Text(
          description,
          style: textTheme.bodyMedium!.copyWith(
            color: primaryColor500,
          ),
        ),
      ],
    );
  }
}
