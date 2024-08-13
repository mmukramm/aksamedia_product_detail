import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/text_theme.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    super.key,
    required List<String> bottomSheetItems,
  }) : _bottomSheetItems = bottomSheetItems;

  final List<String> _bottomSheetItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                ),
              ),
              Text(
                'Bagikan Produk',
                style: textTheme.titleSmall,
              )
            ],
          ),
          ListView.separated(
            separatorBuilder: (_, __) => const Divider(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            itemCount: _bottomSheetItems.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                _bottomSheetItems[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
