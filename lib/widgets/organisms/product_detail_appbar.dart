import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/helpers/app_size.dart';
import 'package:aksamedia_product_detail/core/helpers/asset_path.dart';
import 'package:aksamedia_product_detail/core/helpers/svg_helper.dart';
import 'package:aksamedia_product_detail/widgets/atoms/page_view_image.dart';

class ProductDetailAppbar extends StatelessWidget {
  final List<String> productImages;
  final PageController pageViewController;
  const ProductDetailAppbar({
    super.key,
    required this.productImages,
    required this.pageViewController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: AppSize.getDeviceHeight(context) * .45,
      pinned: true,
      backgroundColor: scaffoldColor,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: PageView.builder(
          itemCount: productImages.length,
          controller: pageViewController,
          itemBuilder: (context, index) =>
              PageViewImage(imageName: productImages[index]),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 20,
          decoration: BoxDecoration(
            color: scaffoldColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: SvgHelper(
          assetPath: AssetPath.getIcon('arrow-left.svg'),
          width: 32,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgHelper(
            assetPath: AssetPath.getIcon('import.svg'),
            width: 32,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgHelper(
            assetPath: AssetPath.getIcon('shopping-cart.svg'),
            width: 32,
          ),
        ),
      ],
    );
  }
}
