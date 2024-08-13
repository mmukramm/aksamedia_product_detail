import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';

class SizeLabel extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onClick;
  const SizeLabel({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color: primaryColor100,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(
                  color: primaryColor900,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                )
              : null,
        ),
        child: Text(
          name,
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}
