import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/widgets/molecules/color_container.dart';
import 'package:aksamedia_product_detail/widgets/molecules/size_container.dart';

class SizeColorContainer extends StatefulWidget {
  const SizeColorContainer({super.key});

  @override
  State<SizeColorContainer> createState() => _SizeColorContainerState();
}

class _SizeColorContainerState extends State<SizeColorContainer> {
  late final List<String> packets;
  late final List<Color> colors;

  @override
  void initState() {
    super.initState();
    packets = [
      'Packet 1',
      'Packet 2',
    ];
    colors = [
      const Color(0xFFDDB69A),
      const Color(0xFF5B3E36),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: primaryColor500,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeContainer(packets: packets),
          const SizedBox(height: 12),
          ColorContainer(colors: colors),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: textTheme.bodyLarge,
              children: [
                const TextSpan(text: 'Stok : '),
                TextSpan(text: '99+ pcs', style: textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
