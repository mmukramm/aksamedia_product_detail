import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/core/helpers/asset_path.dart';
import 'package:aksamedia_product_detail/core/helpers/svg_helper.dart';

class DescriptionContainer extends StatefulWidget {
  final String description;
  const DescriptionContainer({
    super.key,
    required this.description,
  });

  @override
  State<DescriptionContainer> createState() => _DescriptionContainerState();
}

class _DescriptionContainerState extends State<DescriptionContainer> {
  late final ValueNotifier<bool> isCollapse;
  @override
  void initState() {
    super.initState();
    isCollapse = ValueNotifier(false);
  }

  @override
  void dispose() {
    super.dispose();
    isCollapse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isCollapse,
      builder: (context, value, _) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deskripsi',
                  style: textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgHelper(
                    width: 32,
                    assetPath: AssetPath.getIcon('document.svg'),
                    color: infoColor500,
                  ),
                ),
              ],
            ),
            Text(
              widget.description.trim(),
              maxLines: value ? null : 6,
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => isCollapse.value = !value,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Selanjutnya',
                    style: textTheme.bodyLarge!.copyWith(
                      color: infoColor500,
                    ),
                  ),
                  const SizedBox(width: 12),
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(value ? .5 : 0),
                    child: SvgHelper(
                      width: 24,
                      assetPath: AssetPath.getIcon('arrow-down.svg'),
                      color: infoColor500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
