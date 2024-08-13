import 'package:flutter/material.dart';

import 'package:aksamedia_product_detail/models/product.dart';
import 'package:aksamedia_product_detail/core/styles/colors.dart';
import 'package:aksamedia_product_detail/core/styles/text_theme.dart';
import 'package:aksamedia_product_detail/core/helpers/svg_helper.dart';
import 'package:aksamedia_product_detail/core/helpers/asset_path.dart';
import 'package:aksamedia_product_detail/widgets/atoms/custom_button.dart';
import 'package:aksamedia_product_detail/widgets/organisms/description_container.dart';
import 'package:aksamedia_product_detail/widgets/organisms/product_card_list.dart';
import 'package:aksamedia_product_detail/widgets/organisms/share_bottom_sheet.dart';
import 'package:aksamedia_product_detail/widgets/molecules/price_container.dart';
import 'package:aksamedia_product_detail/widgets/organisms/size_color_container.dart';
import 'package:aksamedia_product_detail/widgets/organisms/product_detail_appbar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late final List<String> _productImages;
  late final List<String> _bottomSheetItems;
  late final List<Product> _otherProducts;
  late final List<Product> _similarProducts;
  late final PageController _pageViewController;
  late final String description;

  @override
  void initState() {
    super.initState();
    _productImages = [
      'product-image.png',
      'product-image.png',
      'product-image.png',
    ];

    _bottomSheetItems = [
      'Teks dan Link',
      'Gambar',
    ];

    _pageViewController = PageController(initialPage: 0);

    description = '''
*New Material* 
Terbuat dari bahan 100% Katun Linen yang membuat nyaman jika digunakan. 
Menggunakan fit Relaxed Fit.
-
SIZE CHART RELAXED SHIRT....
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tortor metus, tincidunt vel lectus sed, elementum aliquet mi. Nam eu nisi dictum, semper lectus nec, dignissim tortor. Cras id dapibus urna. Nullam venenatis eros vitae dui consequat, id faucibus mauris molestie. Sed ut velit mi. Maecenas nec turpis sed tortor commodo fermentum et sed orci.
    ''';

    _otherProducts = [
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: false,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: true,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: true,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: false,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
    ];
    _similarProducts = [
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: true,
        price: 142400,
        amount: 120,
        commission: .3,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: false,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: false,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
      const Product(
        name: 'Beauty Set by Irvie ',
        imageName: 'product-image.png',
        isNew: false,
        price: 142400,
        commission: .3,
        amount: 120,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductDetailAppbar(
            productImages: _productImages,
            pageViewController: _pageViewController,
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: secondaryColor500,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: textTheme.bodyLarge,
                                children: [
                                  TextSpan(
                                      text: 'New ',
                                      style: textTheme.displaySmall),
                                  const TextSpan(
                                    text: 'Product Baru',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ShareBottomSheet(
                                    bottomSheetItems: _bottomSheetItems,
                                  );
                                },
                              );
                            },
                            icon: SvgHelper(
                              width: 28,
                              assetPath: AssetPath.getIcon('share.svg'),
                              color: primaryColor900,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Beauty Set by Irvie',
                              style: textTheme.titleLarge,
                            ),
                            Text(
                              'Irvie group official',
                              style: textTheme.bodyMedium!
                                  .copyWith(color: primaryColor500),
                            ),
                          ],
                        ),
                      ),
                      const PriceContainer(
                        customerPrice: 178000,
                        commissionPercent: .2,
                      ),
                      const SizedBox(height: 20),
                      const SizeColorContainer(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: primaryColor500,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: DescriptionContainer(description: description),
                ),
                Divider(
                  color: primaryColor500,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProductCardList(
                      title: 'Produk lain dari Irvie group official',
                      products: _otherProducts,
                      onClickButtonProduct: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShareBottomSheet(
                              bottomSheetItems: _bottomSheetItems,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    ProductCardList(
                      title: 'Produk Serupa',
                      products: _similarProducts,
                      onClickButtonProduct: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ShareBottomSheet(
                              bottomSheetItems: _bottomSheetItems,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          isShrink: false,
                          isOutline: true,
                          onClick: () {},
                          child: const Text('Tambahkan Ke Toko'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      CustomButton(
                        isShrink: false,
                        onClick: () {},
                        child: SvgHelper(
                          assetPath: AssetPath.getIcon('shopping-cart.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
