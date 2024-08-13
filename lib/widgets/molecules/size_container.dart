import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/widgets/atoms/size_label.dart';

class SizeContainer extends StatefulWidget {
  final List<String> packets;
  const SizeContainer({
    super.key,
    required this.packets,
  });

  @override
  State<SizeContainer> createState() => _SizeContainerState();
}

class _SizeContainerState extends State<SizeContainer> {
  late final ValueNotifier<int> selectedPacket;
  @override
  void initState() {
    super.initState();
    selectedPacket = ValueNotifier(0);
  }

  @override
  void dispose() {
    super.dispose();
    selectedPacket.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ukuran',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: selectedPacket,
          builder: (context, selected, _) {
            return Row(
              children: List.generate(
                widget.packets.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizeLabel(
                    isSelected: selected == index,
                    name: widget.packets[index],
                    onClick: () => selectedPacket.value = index,
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
