import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final bool? isShrink;
  final bool? isOutline;
  const CustomButton({
    super.key,
    required this.child,
    required this.onClick,
    this.isShrink = true,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isShrink! ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isOutline!
                ? const BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                  )
                : BorderSide.none,
          ),
          shadowColor: Colors.transparent,
          backgroundColor: isOutline! ? Colors.transparent : primaryColor900,
          foregroundColor: isOutline! ? primaryColor900 : scaffoldColor,
        ),
        onPressed: onClick,
        child: child,
      ),
    );
  }
}
