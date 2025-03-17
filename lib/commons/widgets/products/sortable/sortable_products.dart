import 'package:flutter/material.dart';

import '../../../../MODEL_NEW/product_model.dart';
import '../../layouts/gridLayout/grid_layout.dart';
import '../products_cards/product_card_vertical.dart';

class SortedProducts extends StatelessWidget {
  const SortedProducts({
    super.key,
    required this.product,
  });

  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        //const SizedBox(height: AppSize.spaceBtwSections),
        GridLayout(
            itemCount: product.length,
            itemBuilder: (_, index) => ProductCardVertical(product: product[index])
        )
      ],
    );
  }
}