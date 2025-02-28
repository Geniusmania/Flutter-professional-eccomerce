import 'package:flutter/cupertino.dart';
import 'package:ui/MODEL_NEW/product_model.dart';
import 'package:ui/commons/widgets/layouts/gridLayout/grid_layout.dart';
import 'package:ui/commons/widgets/products/products_cards/product_card_vertical.dart';
import 'package:ui/commons/widgets/sectionHeader/section_header.dart';

import '../../../../commons/widgets/brandshowcase/brand_show_case.dart';
import '../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, t});
//final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.deafaultspace),
            child: Column(
              children: [
                const BrandShowcase(
                  images: [
                    'assets/products/3.jpg',
                    'assets/products/3.jpg',
                    'assets/products/3.jpg'
                  ],
                ), const BrandShowcase(
                  images: [
                    'assets/products/3.jpg',
                    'assets/products/3.jpg',
                    'assets/products/3.jpg'
                  ],
                ),
                SectionHeading(title: 'You might like', onPressed: () {}),
                GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) =>  ProductCardVertical(product: ProductModel.empty(),))
              ],
            ),
          ),
        ]);
  }
}
