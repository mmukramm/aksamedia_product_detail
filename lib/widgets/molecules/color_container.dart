import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/widgets/atoms/color_label.dart';

class ColorContainer extends StatefulWidget {
  final List<Color> colors;
  const ColorContainer({super.key, required this.colors});

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  late final ValueNotifier<int> selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = ValueNotifier(0);
  }

  @override
  void dispose() {
    super.dispose();
    selectedColor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Warna',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: selectedColor,
          builder: (context, selected, _) {
            return Row(
              children: List.generate(
                widget.colors.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ColorLabel(
                    colorHex: widget.colors[index],
                    isSelected: selected == index,
                    onClick: () => selectedColor.value = index,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
