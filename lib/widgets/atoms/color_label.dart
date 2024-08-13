import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';

class ColorLabel extends StatelessWidget {
  final Color colorHex;
  final bool isSelected;
  final VoidCallback onClick;
  const ColorLabel({
    super.key,
    required this.colorHex,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: colorHex,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(
                  color: primaryColor900,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignCenter,
                )
              : null,
        ),
      ),
    );
  }
}
