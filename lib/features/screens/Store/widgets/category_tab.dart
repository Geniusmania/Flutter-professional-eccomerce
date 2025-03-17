import 'package:flutter/cupertino.dart';
import 'package:ui/MODEL_NEW/category_model.dart';
import 'package:ui/commons/widgets/category_brand/category_brands.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';
import 'package:ui/features/screens/all_products/all_products.dart';
import 'package:ui/features/shop/controllers/category_controller.dart';

import '../../../../MODEL_NEW/product_model.dart';
import '../../../../commons/widgets/brandshowcase/brand_show_case.dart';
import '../../../../commons/widgets/layouts/gridLayout/grid_layout.dart';
import '../../../../commons/widgets/products/products_cards/product_card_vertical.dart';
import '../../../../commons/widgets/shimmer_effect/brand_shimmer.dart';
import '../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, t, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.deafaultspace),
            child: Column(
              children: [
                CategoryBrands(category: category),
                const SizedBox(height: 16),
                FutureBuilder(
                    future: controller.getCategoryProducts(category.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const BrandShimmer();
                      } else if (snapshot.hasError ||
                          !snapshot.hasData ||
                          snapshot.data == null) {
                        return const Center(child: Text('No data'));
                      }
                      final product = snapshot.data!;
                      return Column(
                        children: [
                          SectionHeading(
                              title: 'You might like',
                              onPressed: () => (() => AllProducts(
                                    title: category.name,
                                    futureMethod: controller
                                        .getCategoryProducts(category.id),
                                  ))),
                          GridLayout(
                              itemCount: product.length,
                              itemBuilder: (_, index) =>
                                  ProductCardVertical(product: product[index])),
                        ],
                      );
                    })
              ],
            ),
          ),
        ]);
  }
}
